// create sitemap.xml
const fs = require('fs');
const path = require('path');

const navigation = [
    {
        title: 'Contents',
        links: [
            {title: '00 Introduction', href: '/'},
            {title: '02 Setup', href: '/quick_start'},
            {title: '03 Hello World', href: '/hello_world'},
            {title: '04 Loading and Saving Data', href: '/load_and_save_data'},
            {title: '05 Column Selection', href: '/column_selection'},
            {title: '06 Modiyfing Dataframes', href: '/modifying_dataframes'},
            {title: '07 Grouping and Aggregation', href: '/grouping_and_agg'},
            {title: '08 Joins', href: '/joins'},
            {title: '09 Window Functions', href: '/window_functions'},
            {title: '10 User Defined Functions (UDFs)', href: '/user_defined_functions'},
            {title: '11 Going Back to Python', href: '/going_back_to_python'},
        ],
    },
]

const domain = 'https://sparkmadeeasy.com'; // Replace with your domain

const sitemapXml = `
<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
    ${navigation[0].links.map((link, index) => `
    <url>
        <loc>${domain}${link.href}</loc>
        <changefreq>daily</changefreq>
        <priority>${index === 0 ? '1.0' : '0.5'}</priority>
    </url>
    `).join('')}
</urlset>
`.trim();

fs.writeFileSync(path.resolve(__dirname, './app/out/sitemap.xml'), sitemapXml);

// Create robots.txt
const robotsTxt = `
User-agent: *
Allow: /

Sitemap: ${domain}/sitemap.xml
`.trim();

fs.writeFileSync(path.resolve(__dirname, './app/out/robots.txt'), robotsTxt);
