build_npm:
	cd app && doppler run -- npm run build

build: build_npm
	doppler run -- docker-compose build

deploy: build
	doppler run --command="sh ./scripts/deploy.sh"

undeploy:
	doppler run --command="sh ./scripts/undeploy.sh"