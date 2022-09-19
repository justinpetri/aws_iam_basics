# aws_iam_basics

This file can be run to automate a very basic configuration of AWS's IAM services. In order to run the file, the user will need to create an EC2 instance and identify which region they are in. They will then configure the script with the region, access, and secret keys (see here: https://aws.amazon.com/blogs/security/wheres-my-secret-access-key/). They can then run the script on the configured EC2 instance.

The script works by creating two groups: Admins and Guests. It gives the Admins group a group of managed policies called AdministratorAccess. Guests receive ReadOnlyAccess. See "AWS managed policies for job functions" for reference (https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_job-functions.html). The terraform file then creates users, Alice and Bob, before assigning them to their respective groups.

The purpose of this program is to demonstrate basic proficciency with AWS' IAM. The script can be further modified to add new users, groups, or custom policies as needed.
