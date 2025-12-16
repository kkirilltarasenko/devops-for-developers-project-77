TERRAFORM_WORKDIR = terraform

apply:
	cd $(TERRAFORM_WORKDIR) && terraform apply

destroy:
	cd $(TERRAFORM_WORKDIR) && terraform destroy