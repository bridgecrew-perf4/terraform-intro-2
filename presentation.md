Theme: Fira
text: #D8DEE9
text-strong: #A3BE8C
text-emphasis: #EBCB8B
header: #5E81AC
header-emphasis: #D08770
header-strong: #88C0D0
background-color: #2E3440
footer-style: #2F2F2F
quote: #B48EAD
build-lists: true
list: alignment(left), bullet-character(•)

# A **small** introduction to **Terraform**
## Hosting a website on AWS

---

# Who ami I?

---

![inline 10%](felipe-transparent.png)

Felipe Sere
Principal Software Engineer
8th Light London

[.column]

**@felipesere**
github.com/felipesere
www.felipesere.com

^ at 8th Light for 7 years working on a spread of technologies

^ ...current client I'm part of the platform team
^ We look after the "platform" meaning all the stuff that our teams then use
^ bring their applications to our customers

^ Henry and his colleagues at OWC work with us there so he
^ asked me to drop by and give an introduction to Terraform
^ and the work we do...

---

# What should you get out of this talk?

> The goal is to show enough Terraform for you to go  and explore at your own pace.

^ Mostly about Terraform, and as little AWS as I can get away with
^ I'll be a happy presenter if after this brief session you decide to
^ open some of Terraform files at work, or maybe ask your own operations
^ team what how they work or even just follow through the Demo with
^ at least mild curiosity.

---

# What are we *not* going to talk about?

- "scale", "enterprise", "permissions" ...
- Docker, Kubernetes, ...
- Any more AWS-isms than we need ...

^ We are not going to bother with scale, growth, or anything associated with "enterprise"
^ We are also going to stay away from Docker, Kubernetes or anything super-specific
^ I'm here to show you around a little, so you can follow other tutorials
^ that talk about these topics at greater depth

---

# What do we need?

- Free[^1] AWS account
- An editor
- Internet connection
- Terraform :smile:

[^1]: Does need a credit card :cry:

---

# Getting the tools

## Terraform

Follow https://learn.hashicorp.com/tutorials/terraform/install-cli

## tfswitch

Follow https://tfswitch.warrensbox.com/Install/

^ tfswitch is not super critical, but its a personal rule that I try to use some kind of 
^ to manage versions


---

# Demo & Walkthrough

We are going to create a **website**.
As **fast** as we can.
Hosted on **AWS**.
From **scatch**.


^ And that's it.
^ We are going to do it all in Terraform.
^ I'll do it live with a screenshare.
^ And then we are going to talk about what we saw.

---

_Frantically switches to terminal..._

---

_...aaaaaand we're back._

---

# ...what if this was JavaScript?

[.column]

```javascript
import terraform from 'terraform@0.14.7';
import { aws } from 'aws@3.7'

var greeting = "Hello, World!"

const provider = new aws({region: "eu-west-1", credentials: ...})

const bucket = provider.create("bucket", {
  bucket: "owc-demo-v1",
  acl: "public-read",

  website: {
    index_document = "index.html"
  },

  tags: {
    kind: "demo"
  }
})
```

[.column]

```javascript
const page = provider.create("bucket_object", {
  bucket: bucket.id,
  key: "index.html",
  content_type: "text/html",
  content: `<html>...${greeting}...</html>`
})

console.log(`https://${bucket.regional_bucket_domain_name}/index.html`)
```

^ similar blocks as Terraform
^ Terraform secret sauce happening in the background
^ While we need to tell JS what to do, in TF you only need to describe your desired outcomes
^ "Describe what your world should look like, not how to get there"

---

# Where can you go from here?

- State
- Terraform techniques
  - Remote state & collaboration
  - Modules
  - Refactoring
- And literally _loads_ of providers and resources...

^ We've barely scratched the surface
^ Haven't really talked about how Terraform knows what has changed
^ There are interesting techniques to learn with Terraform
^ Keeping your the state away from your laptop so your team can work on the same thing...
^ Using "Modules" to create grouping of resources... even as a way to share!
^ My current interest: How do you refactor your Terraform code without rebuiling your infrastructure?

^ Loads of places have Terraform support: AWS, Azure, Google, Heroku, DigitalOcean...

---

## Further reading

- Terraform docs
- *Terraform: Up and Running* by Yevgeniy Brikman
- Loads of videos on YouTube
- FreeCodeCamp has tutorials, so does Coursera
- **Use your AWS Free Account**

^ Mild endorsement because other than

---

# :wave:
