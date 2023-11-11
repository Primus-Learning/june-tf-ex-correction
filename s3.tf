resource "aws_s3_bucket" "scripts_buckets" {
  bucket = "pl-demo-ex-jun2023"
  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_object" "object" {
  bucket   = aws_s3_bucket.scripts_buckets.id
  for_each = fileset("${path.module}", "**/*.sh")
  key      = each.value
  source   = "${path.module}/${each.value}"
}
