# Makefile в корне проекта

ANSIBLE_WORKDIR = ansible
TERRAFORM_WORKDIR = terraform

.PHONY: ansible-terraform ansible-deploy terraform-init terraform-plan terraform-apply terraform-destroy

ansible-terraform:
	make -C $(ANSIBLE_WORKDIR) terraform

ansible-deploy:
	make -C $(ANSIBLE_WORKDIR) deploy

terraform-init:
	make -C $(TERRAFORM_WORKDIR) init

terraform-plan:
	make -C $(TERRAFORM_WORKDIR) plan

terraform-apply:
	make -C $(TERRAFORM_WORKDIR) apply

terraform-destroy:
	make -C $(TERRAFORM_WORKDIR) destroy
