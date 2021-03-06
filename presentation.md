Theme: Ostrich
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

# A **small** introduction to Terraform

---

# Who ami I?

---

Felipe Sere
Principal Software Engineer
8th Light London

^ ...current client I'm part of the platform team
^ We look after the "platform" meaning all the stuff that our teams then use
^ bring their applications to our customers

^ Henry and his colleagues at OWC work with us there so he
^ asked me to drop by and give an introduction to Terraform
^ and the work we do...


---

# What are we going to talk about and why?

> The goal is to give you a taste and enough for you to explore at your own pace.

^ Mostly about Terraform, and as little AWS as I can get away with
^ I'll be a happy presenter if after this brief session you decide to
^ open some of Terraform files at work, or maybe ask your own operations
^ team what how they work or even just follow through the Demo with
^ at least mild curiosity.

---

# What are we *not* going to talk about?

- "scale", "enterprise", "permissions"...
- Docker, Kubernetes,...

^ We are not going to bother with scale, growth, or anything associated with "enterprise"
^ We are also going to stay away from Docker, Kubernetes or anything super-specific
^ I'm here to show you around a little, so you can follow other tutorials
^ that talk about these topics at greater depth

---

# What do we need?

- Free AWS account
- An editor
- Internet connection

---

# Demo & Walkthrough

We are going to create a --website--.
As --fast-- as we can.
From --scatch--.

^ And that's it.
^ We are going to do it all in Terraform.
^ I'll do it live with a screenshare.
^ And then we are going to talk about what we saw.

---

...demo...

---

# ...what if this was JavaScript?

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

const page = provider.create("bucket_object", {
  bucket: bucket.id,
  key: "index.html",
  content_type: "text/html",
  content: `<html>...${greeting}...</html>`
})

console.log(`https://${bucket.regional_bucket_domain_name}/index.html`)
```

> similar blocks as Terraform
> Terraform secrect sauce happening in the background

---

# Where can you go from here?

- There are maaaaaaaany providers to explore
- Courses, Videos on Youtube
- Tutorials

^ Loads of places have Terraform support: AWS, Azure, Google, Heroku, DigitalOcean...

---

## Resources

---
