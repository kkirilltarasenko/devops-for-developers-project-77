TERRAFORM_WORKDIR = terraform
ANSIBLE_WORKDIR = ansible
INVENTORY = inventory.ini
PLAYBOOK = playbook.yml
VAULT_PASS_FILE = vault_pass.txt

apply:
	cd $(TERRAFORM_WORKDIR) && terraform apply

destroy:
	cd $(TERRAFORM_WORKDIR) && terraform destroy

deploy:
	cd $(ANSIBLE_WORKDIR) && ansible-playbook -i $(INVENTORY) $(PLAYBOOK) \
	--vault-password-file $(VAULT_PASS_FILE)