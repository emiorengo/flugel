# Flugel.it Test

## Prerequisites

- Terraform (requires version >=0.13)
- Go (requires version >=1.13)
- Go dependencies
  - 	github.com/gruntwork-io/terratest v0.32.8 // indirect
  - 	github.com/stretchr/testify v1.4.0 // indirect

## How to re-run the Test

Go to [Github Actions](https://github.com/emiorengo/flugel/actions) and open the most recent workflow to see _Summary_.
Click on __Re'run Jobs__  button to re-execute the test.
Click on "Test" box to see all the steps and logs. Expanding __Test__ you'll find the result of the test: PASS or FAIL.
PASS means the two tags (_Name=Flugel & Owner=InfraTeam_) were found into the two resources (a EC2 instance and a S3 bucket). Otherwise, you'll get FAIL.

## Job's steps

- Set up Job
- Run actions/checkout@v2
- Configure AWS credentials
- Set up Go
- __Test__
- Post configure AWS credentials
- Run actions/checkout@v2
- Complete Job

## Terraform expected result

```
$ go test -v -timeout 5m
=== RUN   TestTerraform
TestTerraform 2021-02-27T01:02:53-03:00 retry.go:91: terraform [init -upgrade=false]
TestTerraform 2021-02-27T01:02:53-03:00 logger.go:66: Running command terraform with args [init -upgrade=false]
TestTerraform 2021-02-27T01:02:59-03:00 logger.go:66:
TestTerraform 2021-02-27T01:02:59-03:00 logger.go:66: Initializing the backend...
TestTerraform 2021-02-27T01:03:01-03:00 logger.go:66:
TestTerraform 2021-02-27T01:03:01-03:00 logger.go:66: Initializing provider plugins...
TestTerraform 2021-02-27T01:03:01-03:00 logger.go:66: - Using previously-installed hashicorp/aws v3.30.0
TestTerraform 2021-02-27T01:03:03-03:00 logger.go:66:
TestTerraform 2021-02-27T01:03:03-03:00 logger.go:66: Terraform has been successfully initialized!
TestTerraform 2021-02-27T01:03:03-03:00 logger.go:66:
TestTerraform 2021-02-27T01:03:03-03:00 logger.go:66: You may now begin working with Terraform. Try running "terraform plan" to see
TestTerraform 2021-02-27T01:03:03-03:00 logger.go:66: any changes that are required for your infrastructure. All Terraform commands
TestTerraform 2021-02-27T01:03:03-03:00 logger.go:66: should now work.
TestTerraform 2021-02-27T01:03:03-03:00 logger.go:66:
TestTerraform 2021-02-27T01:03:03-03:00 logger.go:66: If you ever set or change modules or backend configuration for Terraform,
TestTerraform 2021-02-27T01:03:03-03:00 logger.go:66: rerun this command to reinitialize your working directory. If you forget, other
TestTerraform 2021-02-27T01:03:03-03:00 logger.go:66: commands will detect it and remind you to do so if necessary.
TestTerraform 2021-02-27T01:03:03-03:00 retry.go:91: terraform [get -update]
TestTerraform 2021-02-27T01:03:03-03:00 logger.go:66: Running command terraform with args [get -update]
TestTerraform 2021-02-27T01:03:09-03:00 retry.go:91: terraform [apply -input=false -auto-approve -lock=false]
TestTerraform 2021-02-27T01:03:09-03:00 logger.go:66: Running command terraform with args [apply -input=false -auto-approve -lock=false]
TestTerraform 2021-02-27T01:03:41-03:00 logger.go:66: aws_s3_bucket.bucket: Creating...
TestTerraform 2021-02-27T01:03:41-03:00 logger.go:66: aws_instance.ec2: Creating...
TestTerraform 2021-02-27T01:03:51-03:00 logger.go:66: aws_s3_bucket.bucket: Still creating... [10s elapsed]
TestTerraform 2021-02-27T01:03:51-03:00 logger.go:66: aws_instance.ec2: Still creating... [10s elapsed]
TestTerraform 2021-02-27T01:04:01-03:00 logger.go:66: aws_s3_bucket.bucket: Still creating... [20s elapsed]
TestTerraform 2021-02-27T01:04:01-03:00 logger.go:66: aws_instance.ec2: Still creating... [20s elapsed]
TestTerraform 2021-02-27T01:04:01-03:00 logger.go:66: aws_s3_bucket.bucket: Creation complete after 20s [id=my-flugel-bucket]
TestTerraform 2021-02-27T01:04:11-03:00 logger.go:66: aws_instance.ec2: Still creating... [30s elapsed]
TestTerraform 2021-02-27T01:04:21-03:00 logger.go:66: aws_instance.ec2: Still creating... [40s elapsed]
TestTerraform 2021-02-27T01:04:23-03:00 logger.go:66: aws_instance.ec2: Creation complete after 42s [id=i-096959f24584e3d4a]
TestTerraform 2021-02-27T01:04:23-03:00 logger.go:66:
TestTerraform 2021-02-27T01:04:23-03:00 logger.go:66: Apply complete! Resources: 2 added, 0 changed, 0 destroyed.
TestTerraform 2021-02-27T01:04:23-03:00 logger.go:66:
TestTerraform 2021-02-27T01:04:23-03:00 logger.go:66: Outputs:
TestTerraform 2021-02-27T01:04:23-03:00 logger.go:66:
TestTerraform 2021-02-27T01:04:23-03:00 logger.go:66: bucket_id = my-flugel-bucket
TestTerraform 2021-02-27T01:04:23-03:00 logger.go:66: instance_id = i-096959f24584e3d4a
TestTerraform 2021-02-27T01:04:23-03:00 retry.go:91: terraform [output -no-color -json bucket_id]
TestTerraform 2021-02-27T01:04:23-03:00 logger.go:66: Running command terraform with args [output -no-color -json bucket_id]
TestTerraform 2021-02-27T01:04:30-03:00 logger.go:66: "my-flugel-bucket"
TestTerraform 2021-02-27T01:04:33-03:00 s3.go:49: Found S3 bucket my-flugel-bucket with tag Name=Flugel
TestTerraform 2021-02-27T01:04:34-03:00 s3.go:49: Found S3 bucket my-flugel-bucket with tag Owner=InfraTeam
TestTerraform 2021-02-27T01:04:34-03:00 retry.go:91: terraform [output -no-color -json instance_id]
TestTerraform 2021-02-27T01:04:34-03:00 logger.go:66: Running command terraform with args [output -no-color -json instance_id]
TestTerraform 2021-02-27T01:04:40-03:00 logger.go:66: "i-096959f24584e3d4a"
TestTerraform 2021-02-27T01:04:41-03:00 retry.go:91: terraform [destroy -auto-approve -input=false -lock=false]
TestTerraform 2021-02-27T01:04:41-03:00 logger.go:66: Running command terraform with args [destroy -auto-approve -input=false -lock=false]
TestTerraform 2021-02-27T01:05:08-03:00 logger.go:66: aws_s3_bucket.bucket: Refreshing state... [id=my-flugel-bucket]
TestTerraform 2021-02-27T01:05:08-03:00 logger.go:66: aws_instance.ec2: Refreshing state... [id=i-096959f24584e3d4a]
TestTerraform 2021-02-27T01:05:36-03:00 logger.go:66: aws_s3_bucket.bucket: Destroying... [id=my-flugel-bucket]
TestTerraform 2021-02-27T01:05:36-03:00 logger.go:66: aws_instance.ec2: Destroying... [id=i-096959f24584e3d4a]
TestTerraform 2021-02-27T01:05:38-03:00 logger.go:66: aws_s3_bucket.bucket: Destruction complete after 1s
TestTerraform 2021-02-27T01:05:46-03:00 logger.go:66: aws_instance.ec2: Still destroying... [id=i-096959f24584e3d4a, 10s elapsed]
TestTerraform 2021-02-27T01:05:56-03:00 logger.go:66: aws_instance.ec2: Still destroying... [id=i-096959f24584e3d4a, 20s elapsed]
TestTerraform 2021-02-27T01:06:06-03:00 logger.go:66: aws_instance.ec2: Still destroying... [id=i-096959f24584e3d4a, 30s elapsed]
TestTerraform 2021-02-27T01:06:11-03:00 logger.go:66: aws_instance.ec2: Destruction complete after 35s
TestTerraform 2021-02-27T01:06:11-03:00 logger.go:66:
TestTerraform 2021-02-27T01:06:11-03:00 logger.go:66: Destroy complete! Resources: 2 destroyed.
--- PASS: TestTerraform (198.53s)
PASS
ok      example.com/mod 200.401s
```

## License

MIT
