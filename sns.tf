provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region     = "ap-southeast-2"
}

# Create SNS Topic
resource "aws_sns_topic" "sns-billing" {
  name = "sns-billing"

  display_name = "billing" # required for topics with SMS subscription
}

resource "aws_sns_topic" "sns-alert" {
  name = "sns-alert"

  display_name = "alert" # required for topics with SMS subscription
}

# Creating manually as email, sms & email-json is not currently supported in terraform
# because the endpoint needs to be authorized and does not generate an ARN until the target email address has been validated.

#resource "aws_sns_topic_subscription" "user_updates_sqs_target" {
  #topic_arn = "${aws_sns_topic.sns-billing.arn}"

  #protocol  = "email"
  #endpoint  = "abc@gmail.com"
#}
