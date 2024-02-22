build_npm:
	cd app && doppler run -- npm run build

build: build_npm build_sitemap
	doppler run -- docker-compose build

build_sitemap:
	node scripts/generateSitemap.js

deploy: build
	doppler run --command="sh ./scripts/deploy.sh"

undeploy:
	doppler run --command="sh ./scripts/undeploy.sh"