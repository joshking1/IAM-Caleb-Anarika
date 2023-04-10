resource "aws_iam_group" "texas_group" {
  name = "TTexas"
}

resource "aws_iam_user" "caleb_user" {
  name = "Caleb-Anarika"
}


resource "aws_iam_group_membership" "caleb_membership" {
  name = aws_iam_user.caleb_user.name
  users = [aws_iam_user.caleb_user.name]
  group = aws_iam_group.texas_group.name
}

resource "aws_iam_user_policy_attachment" "caleb_ec2_full_access" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
  user = aws_iam_user.caleb_user.name
}

resource "aws_iam_user_login_profile" "caleb_login_profile" {
  user = aws_iam_user.caleb_user.name
  password_length = 16
  password_reset_required = true
}

output "caleb_password_secret_path" {
  value = aws_iam_user_login_profile.caleb_login_profile.encrypted_password
}

