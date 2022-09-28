resource "aws_kms_key" "tipkms" {
  description             = "KMS key 1"
  deletion_window_in_days = 7
}

resource "aws_s3_bucket" "tip-cloud-buckets3" {
  bucket = "tip-cloud-ag-bucket"
}

resource "aws_s3_bucket_acl" "tip-cloud-bucketacl" {
  bucket = aws_s3_bucket.tip-cloud-buckets3.id
  acl    = "private"
}

resource "aws_s3_object" "statis_html" {
  key        = "index.html"
  bucket     = aws_s3_bucket.tip-cloud-buckets3.id
  source     = "test.html"
  kms_key_id = aws_kms_key.tipkms.arn
  bucket_key_enabled = true
} 