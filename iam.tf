resource "aws_iam_instance_profile" "apache" {
  name = "apache"
  role = aws_iam_role.apache.name
}

resource "aws_iam_role" "apache" {
  name               = "apache"
  description        = "apache-role"
  assume_role_policy = templatefile("${path.module}/policies/assume-policy.json", {})
}

resource "aws_iam_role_policy_attachment" "apache" {
  role       = aws_iam_role.apache.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}