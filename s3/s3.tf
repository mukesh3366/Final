provider "aws" {
  region     = "ap-south-1"
  access_key = "AKIAWAMH3D6KUKGCLGHC"
  secret_key = "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"
}




resource "aws_s3_bucket" "mbucks" {
  bucket = "mbucks"
}

resource "aws_s3_bucket_policy" "allow_access_from_another_account" {
  bucket = aws_s3_bucket.mbucks.id
  policy = data.aws_iam_policy_document.allow_access_from_another_account.json
}

data "aws_iam_policy_document" "allow_access_from_another_account" {
  statement {
    principals {
      type        = "AWS"
      identifiers = ["123123123"]
    }

    actions = [
      "s3:GetObject",
      "s3:ListBucket",
    ]

    resources = [
      aws_s3_bucket.mbucks.arn,
      "${aws_s3_bucket.mbucks.arn}/*",  
    ]
  }
}
