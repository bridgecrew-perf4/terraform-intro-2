1. Create the terraform block with just the version
  * Show the little version check and introduce `tfswitch`

2. Add the minimal bucket with just the bucket name
  * Talk through which bits are required & by whome
    * `resource`       Terraform keyword that shows a "resource" that can be created/read/updated/deleted
    * `aws_s3_bucket`  Given by the AWS provider, one of the maaaaaaaaaaaaany resources it can create
    * `website`        The name **we** use to reffer to this resouce. Only relevant to terraform though
    * `bucket`         An attribute that we set on the resouce. Configures "something". Very specific to the kind of resource

3. Run `terraform plan`
  * One of the two main commands you are going to run!
  * Terraform tells you what it would do
  * Can be read a little like a git diff
    `+` will add stuff
    `-` will destroy stuff
    `~` will change stuff

3. Run `terraform apply`
  * This will actually go off and do what we asked
  * Show that the bucket now exists in the AWS console https://s3.console.aws.amazon.com/s3/home?region=eu-west-1

4. Add the remaining properties to the bucket
  * Show `terraform apply` again
  * Show that we have changes now
    * some things go from default values to our own things
    * Cleve enough for nested attributes

5. Add the file with the skinny HTML
  * Show the connection between obejct and bucket via `website.id`
  * Show that file now exists in the bucket

6. Bring in remainder of HTML

7. Add an output so we can see our website come together!
  * Click the link!
  * See the access denied!

8. Bring in the `data` source for our policy
  * `data` can be read by Terraform, but it won't create any resources
  * Quite handy for creating JSON or reading values from AWS apis. Stuff like "what regions are there?" "Show me all my buckets..."
  * Ignore the policy-goo in the middle, I don't want to focus on the "best practices" for policies etc...

9. Attach policy to bucket
  * See how we are using attributes from multiple resources?
  * this "attachment" neatly shows the idea behind Terraform that everything is a resource

10. Clicking the link now will present the page! Hurrah!

11. Add a local with the website title (a bit hard to see?)

12. Add a variable for "greeting" with default

13. Show a `destroy` and `apply`
   * By using properties, Terraform can build a graph and do "the right" thing in order

