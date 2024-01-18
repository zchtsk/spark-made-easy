# commands
## Starting a new svelte project
```bash
npm create svelte@latest app
cd app
npm install
npm run dev
```
## Building as static site
Install static site adapter
```bash
npm i -D @sveltejs/adapter-static
```

Update `svelte.config.js`
```js
import adapter from '@sveltejs/adapter-static';

export default {
	kit: {
		adapter: adapter({
			// default options are shown. On some platforms
			// these options are set automatically — see below
			pages: 'build',
			assets: 'build',
			fallback: undefined,
			precompress: false,
			strict: true
		})
	}
};
```

Update `prerender` option in root layout `src/routes/+layout.js`
```js
// This can be false if you're using a fallback (i.e. SPA mode)
export const prerender = true;
```

## Adding tailwindcss
Install Tailwind CSS
```bash
npm install -D tailwindcss postcss autoprefixer
npx tailwindcss init -p
```

In your `svelte.config.js` file, import vitePreprocess to enable processing `<style>` blocks as PostCSS.
```js
import adapter from '@sveltejs/adapter-auto';
import { vitePreprocess } from '@sveltejs/vite-plugin-svelte';
/** @type {import('@sveltejs/kit').Config} */
const config = {
  kit: {
    adapter: adapter()
  },
  preprocess: vitePreprocess()
};
export default config;
```

Add the paths to all of your template files in your `tailwind.config.js` file.
```js
/** @type {import('tailwindcss').Config} */
export default {
  content: ['./src/**/*.{html,js,svelte,ts}'],
  theme: {
    extend: {}
  },
  plugins: []
};
```

Create a `./src/app.css` file and add the @tailwind directives for each of Tailwind’s layers.
```js
@tailwind base;
@tailwind components;
@tailwind utilities;
```

Create a `./src/routes/+layout.svelte` file and import the newly-created app.css file.
```js
<script>
  import "../app.css";
</script>

<slot />
```