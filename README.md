# ChatOps WG Infra
See [ChatOps for non-DevOps people Working Group 2018/01](https://github.com/fititnt/chatops-wg)
for more information about this repository.

- [Logbook of ChatOpsWG VM](logbook/chatopswg.sh) - (_e.g. how the VM was configured to run docker containers_)
- The containers
  - [Containers on chatops-wg-infra](containers/chatopswg)
  - [chatops-wg-ia-php-botman](https://github.com/fititnt/chatops-wg-ia-php-botman)
  - [chatops-wg-ia-js-botkit](https://github.com/fititnt/chatops-wg-ia-js-botkit)
- [DNS of domains used](dns.tsv)

## Domains

See list of domains on [chatops-wg README.md](https://github.com/fititnt/chatops-wg#deliverables-of-the-group-so-far).

For internal usage URLs:
- Traefik, our load balancer: <http://traefik.chatopswg.xyz:8080>
  - Note: This URL is publicly available for educational reasons. **Do not** expose this trafik URL to projects in production.
