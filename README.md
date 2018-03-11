# ChatOps WG 2018/01 - Infra
See [ChatOps for non-DevOps people Working Group 2018/01](https://github.com/fititnt/chatops-wg)
for more information about the motivation of this repository.

This repository is part of what is the documentation and Infrastructure as a
Code on **how to do a playground for test softwares and integrations** related
to ChatOps and strategies with their tools that allow faster boostraping of
[intelligent agents](https://en.wikipedia.org/wiki/Intelligent_agent).
**Is desirable [NoOps approach](http://searchcloudapplications.techtarget.com/definition/noops)**
(for the managers and programmers, not for us DevOps that implement).
[The working group](https://github.com/fititnt/chatops-wg) is limited to first
semester of 2018, but the general idea is aligned with efforts in the long run
with [Etica.AI/forum](https://github.com/EticaAI/forum) as one way to [empower non-developer people by looking how to do the interfaces of tomorrow](https://www.youtube.com/watch?time_continue=1125&v=zhkTHkIZJEc).

**If you do DevOps, a more sincere and practical explanation:** we configure
some open source software using containers, setup some integrations with
external services to abstract complexity and then do free support for some
coworkers who are testing on experimental projects aiming real world usage.
They debug problems and expend way more time than would be acceptable
for us to propose be tested on our companies or clients: the usage would be near
bleeding-edge as a product or service even if the underline technologies are
ready for use in production or it depends of knowledge beyond scope of desired
for who do DevOps, but depends on our help to be archived. At the end we have
not only experience on new usages as our DevOps roles, but these coworkers are
willing to help we push innovation to our companies or clients.

## Overview

<!--
TL;DR: a [virtual machine is used  configured to run docker containers](logbook/chatopswg.sh)

### Shortcuts

#### URLs

- [Traefik](https://github.com/containous/traefik), our load balancer: <http://traefik.chatopswg.xyz:8080>
  - _Note: This URL is publicly available for educational reasons. Is not a good idea expose this trafik URL to projects in production._
- [Portainer](https://github.com/portainer/portainer), Simple management UI for Docker: <https://portainer.chatopswg.xyz>
  - Contact us for password

The URL of applications that are not just to run the infrastructure
, [see main repository, chatops-wg](https://github.com/fititnt/chatops-wg).


#### How things are configured:

-->

- How the machine running containers is configured: read the [Logbook of ChatOpsWG "Alpha" server](logbook/chatopswg.sh)
  - Yes, we could convert this to a Chief / Puppet later; we lack of people who would focus on it
- How the containers are configured:
  - [traefik](https://github.com/containous/traefik), [Rocket.Chat](https://github.com/RocketChat/Rocket.Chat), [portainer](https://github.com/portainer/portainer), placeholder: [chatops-wg-infra/containers/chatopswg](containers/chatopswg)
  - Sample agent with BotMan PHP: [chatops-wg-ia-php-botman](https://github.com/fititnt/chatops-wg-ia-php-botman)
  - Sample agent with Botkit: [chatops-wg-ia-js-botkit](https://github.com/fititnt/chatops-wg-ia-js-botkit)
- [DNS of domains used](dns.tsv)

The URL of applications that are not just to run the infrastructure
, [see main repository, chatops-wg](https://github.com/fititnt/chatops-wg).

<!--

### The concept: the motivation
The general idea is document the process of all that could be possible in
the lifetime of the working group.

_TODO: write about https://en.wikipedia.org/wiki/Bootstrapping#Business (fititnt, 2018-03-03 22:44 BRT)_

_TODO: write about https://en.wikipedia.org/wiki/Minimum_viable_product (fititnt, 2018-03-03 22:44 BRT)_

_TODO: add the real overview (fititnt, 2018-03-03 21:53 BRT)_


## Important notice

_TODO: write that we need more people who would do real usage than who do 
devops, since takes time for each group trying something advance they
knowledge than the potencial of how provice infra setup and support (fititnt, 2018-03-11 01:50 BRT)_

Document work done in infrastructure is easier than the other areas of the group,
since we can do [Infrastrutucre as a Code](https://en.wikipedia.org/wiki/Infrastructure_as_Code).
But for other areas on this working group, there is no direct equivalent to a
`docker-compose up` [1] from knowledge need for things like [how to
design a chatbot (Portuguese)](https://brasil.uxdesign.cc/ux-e-chatbots-boas-pr%C3%A1ticas-para-desenhar-interfaces-conversacionais-9beb0ba293f2).


1: `docker-compose up` is a (... TODO: explain the meaning (fititnt, 2018-03-10 14:36 BRT))

-->