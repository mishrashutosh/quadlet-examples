This repo contains some example quadlet files to host web apps like WordPress and others via rootful Podman.

Quadlet files are located at `/etc/containers/systemd` in a flat structure. You can organize them in directories.

I use Caddy as the reverse proxy and web server. Example Caddyfile is at `/etc/caddy/Caddyfile`.

Podman works best on RedHat-aligned Linux distros, but it'll run just fine on openSUSE MicroOS, Debian, Ubuntu, Arch, etc. Podman 5.5+ is required for some quadlet features used in these examples.

Refer the official documentation for Podman quadlets: https://docs.podman.io/en/latest/markdown/podman-systemd.unit.5.html

#### Notes

1. My examples use rootful Podman with automatic namespace isolation where feasible (`UserNS=auto`). Rootful containers generally have better performance and fewer limitations than rootless containers. They can be pretty much as secure, if not more, when created with isolated namespaces. Automatic namespace isolation requires that the user name `containers` be specified in the `/etc/subuid` and `/etc/subgid` files, with an unused range of subordinate user IDs that Podman containers are allowed to allocate. Example: `containers:2147483647:2147483648`.

```
    $ cat /etc/subuid
    containers:2147483647:2147483648
```

2. I use templates for better management of container apps/sites of the same application type. Drop-ins can be used for container-specific configuration. Check `wp-app@example2.com.container.d`.

3. Podman can automatically pull updated images and recreate containers. Enable `podman-auto-update.timer` for this to work.

    `$ systemctl enable --now podman-auto-update.timer`
