<!--markdownlint-disable MD013-->
# Homelab для практике на базе K8s

## Стек

- [Proxmox VE](https://www.proxmox.com/en/proxmox-virtual-environment/overview): гипервизор для всех виртуальных машин, NixOS будет запущен поверх него.
- [NixOS](https://nixos.org/): в качестве основной операционной системы
- [Sops](https://github.com/getsops/sops): в качестве менеджера секретных файлов
- [Terraform](https://www.terraform.io/): для управления облачными ресурсами(ресурсами моего сервера)
- [Kubernetes](https://kubernetes.io/): платформа оркестрации контейнеров
- [Headscale](https://headscale.net/): для создания VPN-сети, чтобы можно было работать удаленно с приватными службами
- [PostgreSql](https://www.postgresql.org/): в качестве базы данных для служб

## Службы, которые предоставляет сервер

### Приватные службы

Cуть в том, что они работают в приватной сети для избегания атак и потерь данных.

- [ClamAV](https://www.clamav.net/): для проверки входящего трафика на наличие вирусов
- [VaultWarden](https://github.com/dani-garcia/vaultwarden/): сервер для синхронизации менеджера паролей Bitwarden
- [Syncthing](https://syncthing.net/): сервер для синхронизации файлов между устройствами
- [Ente](https://github.com/ente-io/ente): сервер для хранения медиа(фото, видео)
- [Plane](https://plane.so/): аналог Jira для собственного использования
- [MailCow](https://docs.mailcow.email/): почтовый сервер
- [Portainer](https://www.portainer.io/): дашборд для управления кластером k8s и контейнерами
- [Prometheus](https://prometheus.io/)/[Grafana](https://grafana.com/)/[AlertManager](https://prometheus.io/docs/alerting/latest/alertmanager/): для мониторинга всего сервера и всех служб
- [V2Ray](https://www.v2ray.com/ru/): чтобы подключиться к удаленном серверу где развернут Vless, для обхода блокировок.

### Публичные службы

- [Caddy](https://caddyserver.com/): для того, чтобы предоставить доступ ко всем службам по домену.
- [Matrix](https://matrix.org/): сервер Matrix для личного пользования.
Планируется использовать Element + ElementCalls, чтобы сделать собственный аналог дискорд с поддержкой видео-связи.
- [Mastadon](https://github.com/mastodon/mastodon): сервер Mastadon как страничка-соцсеть.
Чтобы публиковать новости и прочую ересь, связанную с моей жизнью.
- [Zitadel](https://zitadel.com/): позволяет через одного пользователя иметь доступ ко всем аккаунтам
- [GitLab](https://about.gitlab.com/install/): репозитория для личных проектов
- [GitLab Runner](https://docs.gitlab.com/runner/): runner для CI/CD в отдельном контейнере
- [GitLab Registry](https://docs.gitlab.com/ee/user/packages/container_registry/): менеджер артефактов для хранения Docker-контейнеров

### Игровые сервера

В планах...

## Кластеры

### Административный кластер

Имеет идентификатор `homelab-a`.
На нем запускаются службы ответственные за мониторинг, конфигурацию сервера и прочие DevOps утилиты.
Например: `Headscale`.

### Пользовательский кластер

Имеет идентификатор `homelab-b`.
На нем запускаются публичные службы.
Например: `Matrix`.

### Кластер-хранилище

Имеет идентификатор `homelab-c`.
На нем запускаются службы, которые отвечают за хранение данных.
Например: `Ente`.

## Документация

1. [Настройка Proxmox VE](./docs/proxmox_setup.md)
