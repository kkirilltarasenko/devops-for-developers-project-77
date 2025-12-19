### Hexlet tests and linter status:

[![Actions Status](https://github.com/kkirilltarasenko/devops-for-developers-project-77/actions/workflows/hexlet-check.yml/badge.svg)](https://github.com/kkirilltarasenko/devops-for-developers-project-77/actions)

## DevOps for Developers — Project 77

Проект демонстрирует развёртывание и конфигурацию веб-приложения в Yandex Cloud
с использованием **Terraform** и **Ansible**.

Инфраструктура включает:

- виртуальные машины
- сеть и подсети
- Application Load Balancer (ALB) с HTTPS
- DNS-зону и сертификат
- PostgreSQL-кластер
- конфигурацию приложения через Ansible

---

## Требования

Перед началом работы убедитесь, что установлены:

- Terraform >= 1.5
- Ansible >= 2.15
- Make
- SSH-ключ для подключения к VM
- Yandex Cloud IAM

---

## Подготовка окружения

### 1. Клонирование репозитория

```bash
git clone https://github.com/kkirilltarasenko/devops-for-developers-project-77.git
cd devops-for-developers-project-77
```

## Настройка Terraform

## Перейдите в директорию terraform и создайте файл с переменными:

```bash
cp terraform/config.auto.tfvars.template terraform/config.auto.tfvars
```

Заполните файл config.auto.tfvars, указав необходимые значения, включая:

- cloud_id
- folder_id
- zone
- domain_zone
- ssh_public_key_path

## Настройка Ansible Vault

Для расшифровки зашифрованных переменных используется файл:

```bash
echo "<Your password here>" > ansible/vault_pass.txt
```

## Развёртывание инфраструктуры

- Создание инфраструктуры в Yandex Cloud:

```bash
make apply
```

- Удаление инфраструктуры:

```bash
make apply
```

- Деплой приложения после успешного создания инфраструктуры

```bash
make deploy
```
