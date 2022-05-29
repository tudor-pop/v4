login:
	kubectl create secret docker-registry github-reg-cred \
		--docker-server=https://ghcr.io \
		--docker-username=<your-name> \
		--docker-password=<https://github.com/settings/tokens/new> \
		--docker-email=<your-email>

debug-ingress-certificate:
	kubectl get challenges.acme.cert-manager.io -o wide
