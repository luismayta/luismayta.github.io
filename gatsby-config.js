require('dotenv').config()
const path = require('path')

module.exports = {
  siteMetadata: {
    title: 'luismayta.site',
    author: 'Simon Vrachliotis',
    description: 'Swiss front end designer & developer based in Sydney.',
    siteUrl: 'https://luismayta.site',
    twitter: '@luismayta',
    logo: 'https://luismayta.site/icons/icon-512x512.png',
  },
  plugins: [
    `gatsby-plugin-emotion`,
    `gatsby-plugin-robots-txt`,
    `gatsby-plugin-sitemap`,
    `gatsby-plugin-mdx`,
    {
      resolve: `gatsby-source-filesystem`,
      options: {
        name: 'pages',
        path: path.join(__dirname, 'src', 'pages'),
      },
    },
    {
      resolve: 'gatsby-source-filesystem',
      options: {
        name: 'posts',
        path: path.join(__dirname, 'content', 'posts'),
      },
    },
    {
      resolve: 'gatsby-source-filesystem',
      options: {
        name: 'talks',
        path: path.join(__dirname, 'content', 'talks'),
      },
    },
    {
      resolve: 'gatsby-source-filesystem',
      options: {
        name: 'images',
        path: path.join(__dirname, 'src', 'images'),
      },
    },
    {
      resolve: `gatsby-transformer-remark`,
      options: {
        plugins: [
          {
            resolve: `gatsby-remark-images`,
            options: {
              maxWidth: 590,
            },
          },
          {
            resolve: `gatsby-remark-responsive-iframe`,
            options: {
              wrapperStyle: `margin-bottom: 1.0725rem`,
            },
          },
          'gatsby-remark-prismjs',
          'gatsby-remark-copy-linked-files',
          'gatsby-remark-smartypants',
        ],
      },
    },
    `gatsby-transformer-sharp`,
    `gatsby-plugin-sharp`,
    {
      resolve: `gatsby-plugin-google-analytics`,
      options: {
        trackingId: `UA-22027845-1`,
      },
    },
    {
      resolve: `gatsby-plugin-manifest`,
      options: {
        name: `luismayta`,
        short_name: `luismayta`,
        start_url: `/`,
        background_color: `#ffffff`,
        theme_color: `#F85B5B`,
        display: `minimal-ui`,
        icon: `src/assets/sswiss-logo.png`,
      },
    },
    `gatsby-plugin-offline`,
    `gatsby-plugin-react-helmet`,
    `gatsby-plugin-twitter`,
  ],
}
