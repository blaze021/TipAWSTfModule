output "key_arn" {
  description = "The arn of the key"
  value       = aws_kms_key.tipkms.arn
}

output "key_id" {
  description = "The globally unique identifier for the key"
  value       = aws_kms_key.tipkms.id
}

output "s3_bucket_name" {
    description = "The bucket name latter to be used for python program"
    value = aws_s3_bucket.tip-cloud-buckets3.bucket
}