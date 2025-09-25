// sync-notion.js (Fixed Version - No Martian dependency)
const fs = require("fs");
const path = require("path");
const matter = require("gray-matter");

// 从环境变量中获取密钥和数据库 ID
const NOTION_API_KEY = process.env.NOTION_API_KEY;
const NOTION_DATABASE_ID = process.env.NOTION_DATABASE_ID;

const postsDir = path.join(__dirname, "content", "posts");

// Hugo 的 frontmatter 模板
function getFrontmatter(properties, hasHeadings = false) {
  return {
    title: properties.Title?.title?.[0]?.plain_text || properties.Name?.title?.[0]?.plain_text || "",
    date: properties.Date?.date?.start || new Date().toISOString(),
    tags: properties.Tags?.multi_select?.map(tag => tag.name) || [],
    draft: properties.Status?.select?.name !== "Published",
    author: "chenwenkun", // 添加作者信息
    toc: hasHeadings, // 根据是否有标题自动启用TOC
    show_reading_time: true, // 显示阅读时间
  };
}

// 获取页面内容的函数
async function getPageContent(pageId) {
  try {
    const response = await fetch(`https://api.notion.com/v1/blocks/${pageId}/children`, {
      method: 'GET',
      headers: {
        'Authorization': `Bearer ${NOTION_API_KEY}`,
        'Content-Type': 'application/json',
        'Notion-Version': '2022-06-28',
      },
    });

    if (!response.ok) {
      console.warn(`Failed to fetch content for page ${pageId}`);
      return { content: "", hasHeadings: false };
    }

    const data = await response.json();
    return convertBlocksToMarkdown(data.results);
  } catch (error) {
    console.warn(`Error fetching content for page ${pageId}:`, error.message);
    return { content: "", hasHeadings: false };
  }
}

// 将 Notion blocks 转换为 Markdown
function convertBlocksToMarkdown(blocks) {
  let markdown = "";
  let hasHeadings = false; // 追踪是否有标题

  for (const block of blocks) {
    switch (block.type) {
      case 'paragraph':
        const paragraphText = extractText(block.paragraph.rich_text);
        if (paragraphText.trim()) {
          markdown += paragraphText + "\n\n";
        }
        break;

      case 'heading_1':
        hasHeadings = true; // 发现标题
        const h1Text = extractText(block.heading_1.rich_text);
        markdown += `# ${h1Text}\n\n`;
        break;

      case 'heading_2':
        hasHeadings = true; // 发现标题
        const h2Text = extractText(block.heading_2.rich_text);
        markdown += `## ${h2Text}\n\n`;
        break;

      case 'heading_3':
        hasHeadings = true; // 发现标题
        const h3Text = extractText(block.heading_3.rich_text);
        markdown += `### ${h3Text}\n\n`;
        break;

      case 'bulleted_list_item':
        const bulletText = extractText(block.bulleted_list_item.rich_text);
        markdown += `- ${bulletText}\n`;
        break;

      case 'numbered_list_item':
        const numberedText = extractText(block.numbered_list_item.rich_text);
        markdown += `1. ${numberedText}\n`;
        break;

      case 'quote':
        const quoteText = extractText(block.quote.rich_text);
        markdown += `> ${quoteText}\n\n`;
        break;

      case 'code':
        const codeText = extractText(block.code.rich_text);
        const language = block.code.language || '';
        markdown += `\`\`\`${language}\n${codeText}\n\`\`\`\n\n`;
        break;

      case 'divider':
        markdown += "---\n\n";
        break;

      case 'image':
        const imageUrl = block.image.file?.url || block.image.external?.url;
        const caption = block.image.caption?.[0]?.plain_text || '';
        if (imageUrl) {
          markdown += `![${caption}](${imageUrl})\n\n`;
        }
        break;

      default:
        // 对于不支持的块类型，尝试提取文本
        if (block[block.type]?.rich_text) {
          const text = extractText(block[block.type].rich_text);
          if (text.trim()) {
            markdown += text + "\n\n";
          }
        }
        break;
    }
  }

  return { content: markdown.trim(), hasHeadings };
}

// 从 rich_text 数组中提取纯文本和格式
function extractText(richTextArray) {
  if (!richTextArray || !Array.isArray(richTextArray)) {
    return "";
  }

  return richTextArray.map(text => {
    let content = text.plain_text;

    // 应用格式
    if (text.annotations?.bold) content = `**${content}**`;
    if (text.annotations?.italic) content = `*${content}*`;
    if (text.annotations?.code) content = `\`${content}\``;
    if (text.annotations?.strikethrough) content = `~~${content}~~`;

    // 处理链接
    if (text.href) content = `[${content}](${text.href})`;

    return content;
  }).join('');
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
  console.log(`Found ${data.results.length} published posts`);

  if (!fs.existsSync(postsDir)) {
    fs.mkdirSync(postsDir, { recursive: true });
  }

  for (const page of data.results) {
    // 尝试从 Slug 字段获取文件名，如果没有则从 Title 生成
    let slug = page.properties.Slug?.rich_text?.[0]?.plain_text ||
      page.properties.Slug?.title?.[0]?.plain_text;

    if (!slug) {
      // 从标题生成 slug
      const title = page.properties.Title?.title?.[0]?.plain_text ||
        page.properties.Name?.title?.[0]?.plain_text ||
        'untitled';
      slug = title.toLowerCase()
        .replace(/[^a-z0-9\s-]/g, '') // 移除特殊字符
        .replace(/\s+/g, '-')         // 空格替换为连字符
        .replace(/-+/g, '-')          // 多个连字符合并为一个
        .trim('-');                   // 移除首尾连字符
    }

    if (!slug) {
      console.warn(`Page has no valid slug. Skipping.`);
      continue;
    }

    console.log(`Processing: ${slug}`);

    try {
      // 获取页面内容
      const contentResult = await getPageContent(page.id);

      // 生成 frontmatter，传入是否有标题的信息
      const frontmatter = getFrontmatter(page.properties, contentResult.hasHeadings);

      // 创建完整的文件内容
      const fileContent = matter.stringify(contentResult.content, frontmatter);

      // 写入文件
      const filePath = path.join(postsDir, `${slug}.md`);
      fs.writeFileSync(filePath, fileContent);

      console.log(`Successfully synced: ${slug}.md`);
    } catch (error) {
      console.error(`Failed to process page ${slug}:`, error.message);
      continue;
    }
  }

  console.log("Notion sync finished.");
}

syncNotion().catch(error => {
  console.error("Sync script failed:", error);
  process.exit(1);
});
