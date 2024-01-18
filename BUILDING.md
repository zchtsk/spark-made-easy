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

Update `prerender` option in root layout
```js
// This can be false if you're using a fallback (i.e. SPA mode)
export const prerender = true;
```