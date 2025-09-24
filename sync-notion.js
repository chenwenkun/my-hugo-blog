// sync-notion.js (v3 - Final Corrected Version)
const fs = require("fs");
const path = require("path");
const matter = require("gray-matter");
const { Martian } = require("@tryfabric/martian");

// 从环境变量中获取密钥和数据库 ID
const NOTION_API_KEY = process.env.NOTION_API_KEY;
const NOTION_DATABASE_ID = process.env.NOTION_DATABASE_ID;
const postsDir = path.join(__dirname, "content", "posts");

// Hugo 的 frontmatter 模板
function getFrontmatter(properties) {
  return {
    title: properties.Title.title[0]?.plain_text || "",
    date: properties.Date.date?.start || new Date().toISOString(),
    tags: properties.Tags.multi_select.map(tag => tag.name),
    draft: properties.Status.select?.name !== "Published",
  };
}

async function syncNotion() {
  console.log("Fetching published posts from Notion using manual API call...");

  if (!NOTION_API_KEY || !NOTION_DATABASE_ID) {
    throw new Error("Missing NOTION_API_KEY or NOTION_DATABASE_ID in environment variables.");
  }

  // 手动构造 API 请求
  const response = await fetch(`https://api.notion.com/v1/databases/${NOTION_DATABASE_ID}/query`, {
    method: 'POST',
    headers: {
      'Authorization': `Bearer ${NOTION_API_KEY}`,
      'Content-Type': 'application/json',
      'Notion-Version': '2022-06-28',
    },
    body: JSON.stringify({
      filter: {
        property: "Status",
        select: {
          equals: "Published",
        },
      },
      sorts: [
        {
          property: "Date",
          direction: "descending",
        },
      ],
    }),
  });

  if (!response.ok) {
    const errorBody = await response.json();
    console.error("Failed to fetch from Notion API:", errorBody);
    throw new Error(`Notion API request failed with status ${response.status}`);
  }

  const data = await response.json();
  
  // 修正部分：在这里创建 Martian 实例
  // 我们需要手动模拟一个 notionClient 来让 Martian 获取页面子块
  const notionClient = {
    block: {
      children: {
        list: ({ block_id }) => {
          return fetch(`https://api.notion.com/v1/blocks/${block_id}/children`, {
            headers: { 'Authorization': `Bearer ${NOTION_API_KEY}`, 'Notion-Version': '2022-06-28' }
          }).then(res => res.json());
        }
      }
    }
  };
  const martian = new Martian({ notionClient });

  if (!fs.existsSync(postsDir)) {
    fs.mkdirSync(postsDir, { recursive: true });
  }

  for (const page of data.results) {
    const slug = page.properties.Slug.rich_text[0]?.plain_text;
    if (!slug) {
      console.warn(`Page "${page.properties.Title.title[0]?.plain_text}" has no slug. Skipping.`);
      continue;
    }

    console.log(`Processing: ${slug}`);
    
    // 修正部分：现在只用 page.id 调用
    const markdownContent = await martian.pageToMarkdown(page.id);
    
    const frontmatter = getFrontmatter(page.properties);
    const fileContent = matter.stringify(markdownContent, frontmatter);
    const filePath = path.join(postsDir, `${slug}.md`);

    fs.writeFileSync(filePath, fileContent);
    console.log(`Successfully synced: ${slug}.md`);
  }

  console.log("Notion sync finished.");
}

syncNotion().catch(error => {
  console.error("Sync script failed:", error);
  process.exit(1);
});
