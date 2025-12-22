INVENTORY = inventory.ini
PLAYBOOK = playbook.yml
VAULT_PASS_FILE = vault_pass.txt

.PHONY: play-generate-terraform-vars play-deploy

terraform:
	ansible-playbook -i $(INVENTORY) $(PLAYBOOK) \
		--tags terraform \
		--vault-password-file $(VAULT_PASS_FILE)

deploy:
	ansible-playbook -i $(INVENTORY) $(PLAYBOOK) \
		--vault-password-file $(VAULT_PASS_FILE)