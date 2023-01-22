build:
	docker build -t ghcr.io/tudor-pop/v4 . --platform linux/amd64

tag:
	docker tag ghcr.io/tudor-pop/v4 europe-west2-docker.pkg.dev/tudor-pop/v4/v4

login:
	export CR_PAT=
	echo $CR_PAT | docker login ghcr.io -u tudor-pop --password-stdin

run:
	docker rm -f v4
	docker run -p 5000:3000  -dit --name v4 ghcr.io/tudor-pop/v4:1.0

push:
	docker push ghcr.io/tudor-pop/v4
	docker push europe-west2-docker.pkg.dev/tudor-pop/v4/v4 # gcp

pull:
	docker pull ghcr.io/tudor-pop/v4

deploy: build tag push
	ssh home "docker pull ghcr.io/tudor-pop/v4 && docker rm -f resume && docker run -p 5000:5000  -dit --name resume ghcr.io/tudor-pop/v4"
