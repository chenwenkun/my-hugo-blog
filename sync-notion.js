// sync-notion.js
const { Client } = require("@notionhq/client");
const { Martian } = require("@tryfabric/martian");
const fs = require("fs");
const path = require("path");
const matter = require("gray-matter");

// 从环境变量中获取密钥和数据库 ID
const notion = new Client({ auth: process.env.NOTION_API_KEY });
const databaseId = process.env.NOTION_DATABASE_ID;
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
  console.log("Fetching published posts from Notion...");

  // 查询 Notion 数据库，只获取状态为 "Published" 的页面
  const response = await notion.databases.query({
    database_id: databaseId,
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
  });

  if (!fs.existsSync(postsDir)) {
    fs.mkdirSync(postsDir, { recursive: true });
  }

  const martian = new Martian();

  for (const page of response.results) {
    const slug = page.properties.Slug.rich_text[0]?.plain_text;
    if (!slug) {
      console.warn(`Page "${page.properties.Title.title[0]?.plain_text}" has no slug. Skipping.`);
      continue;
    }

    console.log(`Processing: ${slug}`);

    // 将 Notion 页面内容转换为 Markdown
    const markdownContent = await martian.pageToMarkdown(page.id);
    const frontmatter = getFrontmatter(page.properties);
    
    // 使用 gray-matter 将 frontmatter 和 markdown 内容合并
    const fileContent = matter.stringify(markdownContent, frontmatter);
    const filePath = path.join(postsDir, `${slug}.md`);

    // 写入文件
    fs.writeFileSync(filePath, fileContent);
    console.log(`Successfully synced: ${slug}.md`);
  }

  console.log("Notion sync finished.");
}

syncNotion().catch(console.error);
