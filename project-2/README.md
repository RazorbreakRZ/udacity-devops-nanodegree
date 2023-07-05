### Project Title - Deploy a high-availability web app using CloudFormation (Udagram)

The project is delivered as a single YAML file. Instead of separating the project in different logic blocks (like network, load balancers, asgs, etc), I've decided to merge everything in a single one because is easier to deploy/delete using the companion shell script.

Additional decissions taken to requested project:
- The AMI used was an Ubuntu 22: the Ubuntu 18 is not available anymore and use the latest supported version is always a good choice :)
- Instead of using a Launch Configuration for the AutoScaling Group, I've decided to update it to a Launch Template, because the first is entering in a deprecation state https://docs.aws.amazon.com/autoscaling/ec2/userguide/launch-configurations.html
- Also, instead of using a JumpBox (or bastion host) I've added SSM permissions to remotelly connect to the EC2 instances in the private subnets using Session Manager (via web console or cli). This way we prevent to expose a single machine to the internet and manage/rotate SSH keys.
- For the website, I've decided to provide the webapp files from a private S3 Bucket, which is created by the stack and configures the Launch Template of the WebApp ASG. The files must be uploaded in an additional step using the s3-sync shell script and the policy of the bucket allows its retention to prevent human error deletion and full stack removal. 
