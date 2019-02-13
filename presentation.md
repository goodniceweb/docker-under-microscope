class: center, middle, first

<div class="first-page__header">
  <img src="images/iTechArtLogo.png" class="first-page__logo">
  <p class="first-page__caption">Software Engineering Services</p>
</div>

# Docker Under Microscope

<div class="first-page__footer">
  <img src="images/iTechArtComposition.png" class="first-page__footer-image">
</div>

---
class: author-slide

<div class="author">
  <div class="info-box">
    <div class="name">
      Hi there. <br /> I'm Alexey Cherkashin
    </div>
    <div class="info">
      <div class="row">
        Department: D10
      </div>
      <div class="row">
        Technologies: Ruby, React, Docker
      </div>
    </div>
  </div>
</div>

<div class="contact-info">
  <div class="info-box">
    <div class="contact-header">
      Contact Information:
    </div>
    <div class="contact-data">
      <div class="row">
        Phone: +375 29 39 53 194
      </div>
      <div class="row">
        Email: aleksei.cherkashin@itechart-group.com
      </div>
      <div class="row">
        Skype: goodniceweb
      </div>
    </div>
  </div>
</div>

---
layout: true

<div class="regular-page__background">
  <img src="images/iTechArtLogo.png" class="regular-page__logo">
</div>

---

# Agenda

---

# Agenda

1. What is Docker and How it Works?

---

# Agenda

1. What is Docker and How it Works?
2. Use Cases

---

# Agenda

1. What is Docker and How it Works?
2. Use Cases
3. Pros and Cons

---

# Agenda

<ol start="4">
  <li>Top 7 Tips and Tricks</li>
</ol>

---

# Agenda

<ol start="4">
  <li>Top 7 Tips and Tricks</li>
  <li>Best Practices</li>
</ol>

---

# Agenda


<ol start="4">
  <li>Top 7 Tips and Tricks</li>
  <li>Best Practices</li>
  <li>Docker Swarm vs Kubernates</li>
</ol>

---
class: center

# What is Docker?

<img src="images/docker.png" width="400px" />

???

Docker - это OpenSource проект для автоматизации запуска и деплоя приложений
через контейнеры. С помощью docker вы можете отделить ваше приложение
от вашей инфраструктуры и обращаться с инфраструктурой как управляемым приложением. 

In a way, Docker is a bit like a virtual machine. But unlike a virtual machine,
rather than creating a whole virtual operating system, Docker allows applications
to use the same Linux kernel as the system that they're running on and only
requires applications be shipped with things not already running on the host computer.

---
class: center

# How it Works?

![Default-aligned image](images/docker-how-it-works.png)

???

Explanation from official site:

Docker containers wrap up a piece of software in a complete filesystem
that contains everything it needs to run: code, runtime, system tools,
system libraries – anything you can install on a server.

This guarantees that it will always run the same,
regardless of the environment it is running in.

---
class: center

# How it Works?

![Default-aligned image](images/docker-how-it-works2.png)

---
class: center

# Docker vs Virtual Machine

![Default-aligned image](images/containers-vs-virtual-machines.png)

???

We will use comparison with VM. Who have ever ever used VMs? I mean
VirtualBox, Vagrant, VMWare, etc. etc. Sorry guys who never ever used it.
Maybe some things will be harder to understand.

One more official definition.

### General

Containers have similar resource isolation and allocation benefits
as virtual machines but a different architectural approach allows
them to be much more portable and efficient.

#### Virtual Machines

Each virtual machine includes the application, the necessary binaries
and libraries and an entire guest operating system -
all of which may be tens of GBs in size.

#### Containers

Containers include the application and all of its dependencies,
but share the kernel with other containers. They run as an isolated process
in userspace on the host operating system. They’re also not tied
to any specific infrastructure – Docker containers run on any computer,
on any infrastructure and in any cloud.

---

# Use Cases

---

# Use Cases

1. Simplifying Configuration

---

# Use Cases

1. Simplifying Configuration
2. App Isolation

---

# Use Cases

1. Simplifying Configuration
2. App Isolation
3. Rapid Deployment

---
class: center

# How do we use it

<img src="images/CaredoxLogo.jpg" width="700px" />
<img src="images/docker-with-caption.png" width="700px" />

???

For development - all dependencies are Docker containers
For running tests in Elixir service

---
class: center

# Pros and Cons

<img src="images/ProsAndCons.png" width="720px" />
---

# Pros

---

# Pros

* Multi-platform

---

# Pros

* Multi-platform
* Well documented

---

# Pros

* Multi-platform
* Well documented
* Public image register

---

# Cons

---

# Cons

* Performance issues on non-native envs

---

# Cons

* Performance issues on non-native envs
* Run applications with graphical interfaces

---

# Cons

* Performance issues on non-native envs
* Run applications with graphical interfaces
* Steep learning curve

---
class: center

# 7 Tips and Tricks

<img src="images/docker_animals.png" width="720px" />

---

# Difference between CMD and ENTRYPOINT

```Dockerfile
CMD ["/bin/echo", "Hello world"]
ENTRYPOINT ["/bin/echo", "Hello world"]
```

???

- CMD sets default command and/or parameters, which can be
  overwritten from command line when docker container runs.
- ENTRYPOINT configures a container that will run as an executable.

### CMD

CMD instruction allows you to set a default command,
which will be executed only when you run container without
specifying a command. If Docker container runs with a command,
the default command will be ignored. If Dockerfile has more
than one CMD instruction, all but last CMD instructions are ignored.

CMD has three forms:

- `CMD ["executable","param1","param2"]` (exec form, preferred)
- `CMD ["param1","param2"]` (sets additional default parameters for ENTRYPOINT in exec form)
- `CMD command param1 param2` (shell form)

Again, the first and third forms were explained in Shell and Exec forms section.
The second one is used together with ENTRYPOINT instruction in exec form.
It sets default parameters that will be added after ENTRYPOINT parameters
if container runs without command line arguments. See ENTRYPOINT for example.

Let’s have a look how CMD instruction works. The following snippet in Dockerfile

http://goinbigdata.com/docker-run-vs-cmd-vs-entrypoint/

---

# CMD

```Dockerfile
CMD echo "Hello world"
```

```sh
docker run -it <image>
# => Hello world
```

---

# CMD

```Dockerfile
CMD echo "Hello world"
```

```sh
docker run -it <image> /bin/bash
# =>
root@7de4bed89922:/#
```

---

# ENTRYPOINT

```Dockerfile
ENTRYPOINT ["/bin/echo", "Hello"]
CMD ["world"]
```

```sh
docker run -it <image>
# => Hello world
```

---

# ENTRYPOINT

```Dockerfile
ENTRYPOINT ["/bin/echo", "Hello"]
CMD ["world"]
```

```sh
docker run -it <image> John
# => Hello John
```

---

# COPY vs ADD commands

```Dockerfile
# Within a Dockerfile

COPY script.sh /tmp
ADD script.sh /tmp
```

---

# COPY vs ADD commands

```Dockerfile
# 1 - Be able to automatically untar files
ADD scripts.tar.gz /tmp

# 2 - Fetching files from remote URLs
ADD http://www.example.com/script.sh /tmp
```

---

# How to Check if Container is Ready

<img src="images/wait-for-it.png" width="720px" />

???

wait-for-it.sh is a pure bash script that will wait on the availability
of a host and TCP port. It is useful for synchronizing the spin-up
of interdependent services, such as linked docker containers.
Since it is a pure bash script, it does not have any external dependencies.

---
class: smaller-code

# Compose file example

```docker-compose
version: "2"

services:
  web:
    build: .
    ports:
      - "80:8000"
    depends_on:
      - "db"
    command: ["./wait-for-it.sh", "db:5432", "--", "puma"]
  db:
    image: postgres
```

---

# Where is my space?

<div class="center">
  <img src="images/screaming.jpg" width="620px" />
</div>

---

# Cleanup commands

Remove all unused images:

```sh
docker image prune -a
```

Delete all stopped containers, dangling images, networks,
unused volumes and build cache at the same time:

```sh
docker system prune -a --volumes
```

---

# Use aliases

```sh
alias dr='docker rm $(docker ps -aq)'
alias ds='docker stop $(docker ps -aq)'
alias di='docker images'
alias dri='docker rmi $(docker images -q)'
alias dsr='ds && dr'
alias dps='docker ps -a'
alias dcup='docker-compose up'
```

---

# Manage env variables

Instead of doing things like this:

```sh
docker run -it \
  -e TEST=1234 \
  -e TEST1=3456 \
  -e TEST2=5678 \
  -e TEST3=7890 \
  --rm alpine /bin/ash
```

---

# Use env file

You can do it other way:

```sh
# env.file content

TEST=1234
TEST1=3456
TEST2=5678
TEST3=7890
```

---

# Much clearer, isn't it?

```sh
docker run -it \
  --env-file ./env.list \
  --rm alpine /bin/ash
```

---

# #docker

1. Download an IRC Client
2. Connect to the irc.freenode.net network
3. Join the #docker channel

???

I’m not talking about the hashtag!! I’m talking about the channel
on Freenode on IRC. It’s hands-down the best place to meet with
fellow Dockers online, ask questions (all levels welcome!), and
seek truly excellent expertise. At any given time there are about
1000 people or more sitting in, and it’s a great community as well
as resource. Seriously, if you’ve never tried it before, go check
it out. I know IRC can be scary if you’re not accustomed to using it,
but the effort of setting it up and learning to use it a bit will
pay huge dividends for you in terms of knowledge gleaned.
I guarantee it. So if you haven’t come to hang out with us
on IRC yet, do it!

---

# Best Practices

---

# Best Practices

- Dockerfile

---

# Best Practices

- Dockerfile
- Docker Compose File

---

# Dockerfile Best Practices

---

# Dockerfile Best Practices

1. Decouple applications

---

# Dockerfile Best Practices

1. Decouple applications
2. Minimize amount of layers

---

# Dockerfile Best Practices

1. Decouple applications
2. Minimize amount of layers
3. Sort multi-line arguments

---

# Dockerfile Best Practices

1. Decouple applications
2. Minimize amount of layers
3. Sort multi-line arguments
4. Keep image as tiny as possible

---

# How to Reduce Image Size

---

# How to Reduce Image Size

1. Consider build context

---

# How to Reduce Image Size

1. Consider build context
2. Use .dockerignore file

---

# How to Reduce Image Size

1. Consider build context
2. Use .dockerignore file
3. Don't install extra packages

---

# How to Reduce Image Size

1. Consider build context
2. Use .dockerignore file
3. Don't install extra packages
4. Use multi-stage builds

---

# Docker Compose File Best Practices

---

# Docker Compose File Best Practices

1. Use version 3 or above

---

# Docker Compose File Best Practices

1. Use version 3 or above
2. Reuse configuration

---

# Docker Compose File Best Practices

1. Use version 3 or above
2. Reuse configuration
3. Use env variables

---

# Best Practice for both

Use JSON for `CMD` and `ENTRYPOINT` commands.

Instead of doing like this:

```Dockerfile
ENTRYPOINT "program arg1 arg2"
```

Please do it with JSON:

```Dockerfile
ENTRYPOINT ["program", "arg1", "args2"]
```

---
class: center

# Docker Swarm vs Kubernates

<img src="images/swarm-vs-kubernates.png" width="720px" />

---
class: center

# What is container orchestration?

<img src="images/docker-team.jpg" width="620px" />

---

# Docker Swarm - Pros

---

# Docker Swarm - Pros

1. Easy of use

---

# Docker Swarm - Pros

1. Easy of use
2. Backwards compatibility

---

# Docker Swarm - Pros

1. Easy of use
2. Backwards compatibility
3. Open Source

---

# Docker Swarm - Cons

---

# Docker Swarm - Cons

1. Young project

---

# Docker Swarm - Cons

1. Young project
2. Limited features

---

# Kubernates - Pros

---

# Kubernates - Pros

1. Mature project

---

# Kubernates - Pros

1. Mature project
2. Self-healing: auto-placement, auto-restart, auto-replication, auto-scaling

---

# Kubernates - Pros

1. Mature project
2. Self-healing: auto-placement, auto-restart, auto-replication, auto-scaling
3. Modular

---

# Kubernates - Cons

---

# Kubernates - Cons

1. Difficult to set-up

---

# Kubernates - Cons

1. Difficult to set-up
2. Steeper learning curve than Docker Swarm

---
class: center

# Decision is up to you!

<img src="images/swarm-vs-kubernates.png" width="720px" />

---
class: center

# That's all

<img src="images/nice-docker-guy.png" width="420px" />

---
class: center

# Let's recap

<img src="images/docker-everywhere.jpg" width="620px" />

---
class: center

# Docker helps to eliminate some issues

<img src="images/works-on-my-machine.jpeg" width="520px" />

---
class: center

# ...but it has downsides too

<img src="images/docker-cons.png" height="450px" />

---
class: center

# Use Docker wisely

<img src="images/xzibit.jpg" height="450px" />

---
class: center

# Docker is developer friendly

<img src="images/docker-team2.jpg" height="500px" />

---
class: center

# Happy Dockering!

<img src="images/happy-dockering.jpeg" width="720px" />
