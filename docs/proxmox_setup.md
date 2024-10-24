<!--markdownlint-disable MD013-->
# Настройка Proxmox VE после установки

## Настройка SSH

Создаем пользователя для SSH.

```sh
apt-get update && apt-get install -y sudo
adduser lab
usermod -aG sudo lab
```

Далее настраиваем SSH.

```sh
mkdir ~/.ssh
nano ~/.ssh/authorized_keys # Добавляем сюда наш публичный ключ
mkdir -p ~/.ssh
chmod 700 ~/.ssh
chmod 600 ~/.ssh/authorized_keys

nano /etc/ssh/sshd_config

Port 2200 # Меняем порт на любой другой свободный
PermitRootLogin no # Отключаем root пользователя
PasswordAuthentication no # Отключаем вход по паролю
```

## Запуск Proxmox VE Post Install

```sh
su - root
# Answer all `yes`
bash -c "$(wget -qLO - https://github.com/tteck/Proxmox/raw/main/misc/post-pve-install.sh)"
```

## Загрузка NixOS ISO в хранилище `local` Proxmox

Для того чтобы мы в конфигурациях могли использовать образ NixOS его надо установить.

Переходите в `Datacenter`->`Host`->`local`->`ISO Images`->`Upload` or `Download from URL`.
