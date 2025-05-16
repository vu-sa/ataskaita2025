import { defineConfig } from 'vitepress'
import { sharedConfig } from './config/shared'

import ltConfig from './config/lt'
import enConfig from './config/en'
import tailwindcss from '@tailwindcss/vite'
import path from 'node:path'
import { fileURLToPath } from 'node:url'
import dsv from '@rollup/plugin-dsv';

// https://vitepress.dev/reference/site-config
export default defineConfig({
  srcDir: './src',
  head: [
    [
      'link',
      { rel: 'preconnect', href: 'https://fonts.googleapis.com' }
    ],
    [
      'link',
      { rel: 'preconnect', href: 'https://fonts.gstatic.com', crossorigin: '' }
    ],
    [
      'link',
      { href: 'https://fonts.googleapis.com/css2?family=Abril+Fatface&family=Atkinson+Hyperlegible:ital,wght@0,400;0,700;1,400;1,700&display=swap', rel: 'stylesheet' }
    ]
  ],
  markdown: {
    // config: (md) => {}
    image: {
      lazyLoading: true
    }
  },
  themeConfig: {
    // https://vitepress.dev/reference/default-theme-config
    ...sharedConfig
  },
  locales: {
    root: {
      label: 'Lietuvių',
      lang: 'lt',
      ...ltConfig

    },
    en: {
      label: 'English',
      lang: 'en',
      link: '/en/',
      ...enConfig
    }
  },
  vite: {
    plugins: [
      tailwindcss({}),
      dsv()
    ],
    resolve: {
      alias: {
        '@': fileURLToPath(new URL('../components', import.meta.url)),
      },
    }
  },
})
