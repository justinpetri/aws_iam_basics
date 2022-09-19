provider "aws" {
    region = "ENTER_REGION"
    access_key = "PATH_TO_ACCESS_KEY"
    secret_key = "PATH_TO_SECRET_KEY"
}

# Creating group administrators
resource "aws_iam_group" "admins" {
    name = "admins"
}
resource "aws_iam_group" "guests" {
    name = "guests"
}

# Attaching job-function policies to groups
resource "aws_iam_policy_attachment" "admin-attachment" {
    name = "admin-attachment"
    groups = [aws_iam_group.admins.name]
    policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}
resource "aws_iam_policy_attachment" "guests-readonly-attach" {
    name = "guests-readonly-attach"
    groups = [aws_iam_group.guests.name]
    policy_arn = "arn:aws:iam::aws:policy/job-function/ViewOnlyAccess"
}

# Creating users
resource "aws_iam_user" "Alice" {
    name = "Alice"
}
resource "aws_iam_user" "Bob" {
    name = "Bob"
}

# Add users to group
resource "aws_iam_group_membership" "admins-users" {
    name = "admins-users"
    users = [aws_iam_user.Alice.name]
    group = aws_iam_group.admins.name
}
resource "aws_iam_group_membership" "guests-users" {
    name = "guests-users"
    users = [aws_iam_user.Bob.name]
    group = aws_iam_group.guests.name
}
