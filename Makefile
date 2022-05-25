IMAGE_NAME=pokta-siwo-sample-app-auth0

dbuild:
	docker build -t $(IMAGE_NAME) -f Dockerfile . -m 4g --progress=plain

drun:
	docker run -p 3000:3000 $(IMAGE_NAME)

hbuild-tc:
	cp src/auth_config_id_trexcloud.json src/auth_config.json
	heroku container:push web --remote heroku-trexcloud

hdeploy-tc: hbuild-tc
	heroku container:release web --remote heroku-trexcloud

hbuild-p:
	cp src/auth_config_id_preview.json src/auth_config.json
	heroku container:push web --remote heroku-preview

hdeploy-p: hbuild-p
	heroku container:release web --remote heroku-preview
