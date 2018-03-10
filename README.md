# ChatOps  Working Group 2018/01 - Infra
See [ChatOps for non-DevOps people Working Group 2018/01](https://github.com/fititnt/chatops-wg)
for more information about the motivation of this repository.

**If you do DevOps**: this repository is part of what is the documentation of
**how to do a playground for test softwares and integrations** related to ChatOps
and tools that allow faster boostraping of [intelligent agents](https://en.wikipedia.org/wiki/Intelligent_agent),
and **is desirable [NoOps approach](http://searchcloudapplications.techtarget.com/definition/noops)**
aiming people that are not software developers. This working group is limited
to first semester of 2018, but the general idea is aligned with efforts in the
long run with [Etica.AI/forum](https://github.com/EticaAI/forum) as one way to
[empower non-developer people by looking how to do the interfaces of tomorrow](https://www.youtube.com/watch?time_continue=1125&v=zhkTHkIZJEc).

## Overview
The general idea is document the process of all that could be possible in
the lifetime of the working group.

_TODO: add the real overview (fititnt, 2018-03-03 21:53 BRT)_

> Notice for DevOps people and anyone reading this after the end of the working
group: the infrastructure is easier than the other areas of the group, since we
can do [Infrastrutucre as a Code](https://en.wikipedia.org/wiki/Infrastructure_as_Code):
We simply cannot `docker-compose up` a knowledge need for [how to design a chatbot (Portuguese)](https://brasil.uxdesign.cc/ux-e-chatbots-boas-pr%C3%A1ticas-para-desenhar-interfaces-conversacionais-9beb0ba293f2),
how to make people from different areas work together, etc.


---

- [Logbook of ChatOpsWG VM](logbook/chatopswg.sh) - (_e.g. how the VM was configured to run docker containers_)
- The containers
  - [Containers on chatops-wg-infra](containers/chatopswg)
  - [chatops-wg-ia-php-botman](https://github.com/fititnt/chatops-wg-ia-php-botman)
  - [chatops-wg-ia-js-botkit](https://github.com/fititnt/chatops-wg-ia-js-botkit)
- [DNS of domains used](dns.tsv)

## Domains

See list of domains on [chatops-wg README.md](https://github.com/fititnt/chatops-wg#deliverables-of-the-group-so-far).

For internal usage URLs:
- Portainer: <https://portainer.chatopswg.xyz>
- Traefik, our load balancer: <http://traefik.chatopswg.xyz:8080>
  - Note: This URL is publicly available for educational reasons. **Do not** expose this trafik URL to projects in production.
