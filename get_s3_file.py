import boto3
import subprocess

session = boto3.Session()

credentials = session.get_credentials()

credentials = credentials.get_frozen_credentials()

aws_access_key = credentials.access_key
aws_secret_key = credentials.secret_key

s3 = session.resource('s3')

bucket_name = subprocess.getoutput("terraform output s3_bucket_name")[1:-1]

my_bucket = s3.Bucket(bucket_name)

for my_bucket_object in my_bucket.objects.all():
    print(my_bucket_object.key)
    my_bucket.download_file(my_bucket_object.key,"index.html")

