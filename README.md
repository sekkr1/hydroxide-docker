# Hydroxide Docker

Hydroxide Protonmail SMTP/IMAP in a Docker!

## How to use

Using the Docker CLI:

```sh
$ # Login to your account (and create auth.json in your volume binding)
$ docker run --rm -it -v /path_to_config:/config:rw sekkr1/hydroxide auth <email>
$ # Run hydroxide
$ docker run -d -v /path_to_config:/config:ro -p 1143:1143 -p 1025:1025 sekkr1/hydroxide serve -smtp-host 0.0.0.0 -imap-host 0.0.0.0
```

Using docker-compose:

```yaml
hydroxide:
    image: sekkr1/hydroxide
    container_name: hydroxide
    volumes:
        - /path_to_config:/config:ro
    ports:
        - "1143:1143/tcp"
        - "1025:1025/tcp"
    command: "serve -smtp-host 0.0.0.0 -imap-host 0.0.0.0"
    restart: unless-stopped
```
