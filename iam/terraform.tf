provider "aws" {}

resource "aws_iam_role" "aws_course_role" {
  name = "aws_course_role"

  assume_role_policy = file("trustPolicy.json")

  tags = {
    Name = "aws_course_role"
    scope = "aws_course"
  }
}

resource "aws_iam_role_policy_attachment" "aws_course_EC2_role_attach" {
  role       = aws_iam_role.aws_course_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ReadOnlyAccess"
}