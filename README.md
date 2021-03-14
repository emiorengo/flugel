# Flugel.it Test

## Prerequisites

- Terraform (requires version >=0.13)
- Go (requires version >=1.13)
- Go dependencies
  - 	github.com/gruntwork-io/terratest v0.32.8 // indirect
  - 	github.com/stretchr/testify v1.4.0 // indirect

## How to re-run the Tests

Go to [Github Actions](https://github.com/emiorengo/flugel/actions) and open the most recent workflow to see _Summary_.
Click on __Re'run Jobs__  button to re-execute the test.
Click on "Test" box to see all the steps and logs. Expanding __Test__ you'll find the result of the test: PASS or FAIL.
PASS means the Application Load Balancer returns status 200 after a HTTP request. That load should be balanced between the two EC2 instances. Otherwise, you'll get FAIL.
Notice the returned body will change depending on the instance that responded. The body's returned is also logged.

## Job's steps for Tests

- Set up Job
- Run actions/checkout@v2
- Configure AWS credentials
- Set up Go
- __Test__
- Post configure AWS credentials
- Run actions/checkout@v2
- Complete Job

## TerraTest expected result for Test 2

```
$ go test -v
=== RUN   TestTerraformHttpExample
=== PAUSE TestTerraformHttpExample
=== CONT  TestTerraformHttpExample
TestTerraformHttpExample 2021-03-14T19:24:50-03:00 retry.go:91: terraform [init -upgrade=false]
TestTerraformHttpExample 2021-03-14T19:24:50-03:00 logger.go:66: Running command terraform with args [init -upgrade=false]
TestTerraformHttpExample 2021-03-14T19:24:53-03:00 logger.go:66:
TestTerraformHttpExample 2021-03-14T19:24:53-03:00 logger.go:66: Initializing the backend...
TestTerraformHttpExample 2021-03-14T19:24:54-03:00 logger.go:66:
TestTerraformHttpExample 2021-03-14T19:24:54-03:00 logger.go:66: Initializing provider plugins...
TestTerraformHttpExample 2021-03-14T19:24:54-03:00 logger.go:66: - Using previously-installed hashicorp/template v2.2.0
TestTerraformHttpExample 2021-03-14T19:24:54-03:00 logger.go:66: - Using previously-installed hashicorp/aws v3.32.0
TestTerraformHttpExample 2021-03-14T19:24:54-03:00 logger.go:66: - Using previously-installed hashicorp/tls v3.1.0
TestTerraformHttpExample 2021-03-14T19:24:55-03:00 logger.go:66:
TestTerraformHttpExample 2021-03-14T19:24:55-03:00 logger.go:66: The following providers do not have any version constraints in configuration,
TestTerraformHttpExample 2021-03-14T19:24:55-03:00 logger.go:66: so the latest version was installed.
TestTerraformHttpExample 2021-03-14T19:24:55-03:00 logger.go:66:
TestTerraformHttpExample 2021-03-14T19:24:55-03:00 logger.go:66: To prevent automatic upgrades to new major versions that may contain breaking
TestTerraformHttpExample 2021-03-14T19:24:55-03:00 logger.go:66: changes, we recommend adding version constraints in a required_providers block
TestTerraformHttpExample 2021-03-14T19:24:55-03:00 logger.go:66: in your configuration, with the constraint strings suggested below.
TestTerraformHttpExample 2021-03-14T19:24:55-03:00 logger.go:66:
TestTerraformHttpExample 2021-03-14T19:24:55-03:00 logger.go:66: * hashicorp/template: version = "~> 2.2.0"
TestTerraformHttpExample 2021-03-14T19:24:55-03:00 logger.go:66: * hashicorp/tls: version = "~> 3.1.0"
TestTerraformHttpExample 2021-03-14T19:24:55-03:00 logger.go:66:
TestTerraformHttpExample 2021-03-14T19:24:55-03:00 logger.go:66: Terraform has been successfully initialized!
TestTerraformHttpExample 2021-03-14T19:24:55-03:00 logger.go:66:
TestTerraformHttpExample 2021-03-14T19:24:55-03:00 logger.go:66: You may now begin working with Terraform. Try running "terraform plan" to see
TestTerraformHttpExample 2021-03-14T19:24:55-03:00 logger.go:66: any changes that are required for your infrastructure. All Terraform commands
TestTerraformHttpExample 2021-03-14T19:24:55-03:00 logger.go:66: should now work.
TestTerraformHttpExample 2021-03-14T19:24:55-03:00 logger.go:66:
TestTerraformHttpExample 2021-03-14T19:24:55-03:00 logger.go:66: If you ever set or change modules or backend configuration for Terraform,
TestTerraformHttpExample 2021-03-14T19:24:55-03:00 logger.go:66: rerun this command to reinitialize your working directory. If you forget, other
TestTerraformHttpExample 2021-03-14T19:24:55-03:00 logger.go:66: commands will detect it and remind you to do so if necessary.
TestTerraformHttpExample 2021-03-14T19:24:55-03:00 retry.go:91: terraform [get -update]
TestTerraformHttpExample 2021-03-14T19:24:55-03:00 logger.go:66: Running command terraform with args [get -update]
TestTerraformHttpExample 2021-03-14T19:24:55-03:00 retry.go:91: terraform [apply -input=false -auto-approve -lock=false]
TestTerraformHttpExample 2021-03-14T19:24:55-03:00 logger.go:66: Running command terraform with args [apply -input=false -auto-approve -lock=false]
TestTerraformHttpExample 2021-03-14T19:25:02-03:00 logger.go:66: data.template_file.client1: Refreshing state...
TestTerraformHttpExample 2021-03-14T19:25:02-03:00 logger.go:66: data.template_file.client2: Refreshing state...
TestTerraformHttpExample 2021-03-14T19:25:02-03:00 logger.go:66: data.template_cloudinit_config.config1: Refreshing state...
TestTerraformHttpExample 2021-03-14T19:25:02-03:00 logger.go:66: data.template_cloudinit_config.config2: Refreshing state...
TestTerraformHttpExample 2021-03-14T19:25:10-03:00 logger.go:66: tls_private_key.privatekey: Creating...
TestTerraformHttpExample 2021-03-14T19:25:12-03:00 logger.go:66: tls_private_key.privatekey: Creation complete after 2s [id=8f2e3adc9f94d0911d672707f99b21e3f30b01a7]
TestTerraformHttpExample 2021-03-14T19:25:12-03:00 logger.go:66: aws_key_pair.generated_key: Creating...
TestTerraformHttpExample 2021-03-14T19:25:12-03:00 logger.go:66: aws_vpc.VPC: Creating...
TestTerraformHttpExample 2021-03-14T19:25:14-03:00 logger.go:66: aws_key_pair.generated_key: Creation complete after 2s [id=keys]
TestTerraformHttpExample 2021-03-14T19:25:22-03:00 logger.go:66: aws_vpc.VPC: Still creating... [10s elapsed]
TestTerraformHttpExample 2021-03-14T19:25:32-03:00 logger.go:66: aws_vpc.VPC: Still creating... [20s elapsed]
TestTerraformHttpExample 2021-03-14T19:25:35-03:00 logger.go:66: aws_vpc.VPC: Creation complete after 22s [id=vpc-0564116a4f9b39b1c]
TestTerraformHttpExample 2021-03-14T19:25:35-03:00 logger.go:66: aws_internet_gateway.default: Creating...
TestTerraformHttpExample 2021-03-14T19:25:35-03:00 logger.go:66: aws_subnet.subnet1: Creating...
TestTerraformHttpExample 2021-03-14T19:25:35-03:00 logger.go:66: aws_subnet.subnet2: Creating...
TestTerraformHttpExample 2021-03-14T19:25:35-03:00 logger.go:66: aws_alb_target_group.alb_target: Creating...
TestTerraformHttpExample 2021-03-14T19:25:35-03:00 logger.go:66: aws_security_group.ec2_sg: Creating...
TestTerraformHttpExample 2021-03-14T19:25:39-03:00 logger.go:66: aws_internet_gateway.default: Creation complete after 5s [id=igw-03eb2a4a72e6dccc4]
TestTerraformHttpExample 2021-03-14T19:25:39-03:00 logger.go:66: aws_route.internet_access: Creating...
TestTerraformHttpExample 2021-03-14T19:25:39-03:00 logger.go:66: aws_alb_target_group.alb_target: Creation complete after 5s [id=arn:aws:elasticloadbalancing:us-west-2:626750626703:targetgroup/alb-group/6fe689ffec7813a9]
TestTerraformHttpExample 2021-03-14T19:25:42-03:00 logger.go:66: aws_route.internet_access: Creation complete after 2s [id=r-rtb-09dcd8d2579cf276c1080289494]
TestTerraformHttpExample 2021-03-14T19:25:43-03:00 logger.go:66: aws_security_group.ec2_sg: Creation complete after 8s [id=sg-054b35623529fb7c6]
TestTerraformHttpExample 2021-03-14T19:25:45-03:00 logger.go:66: aws_subnet.subnet1: Still creating... [10s elapsed]
TestTerraformHttpExample 2021-03-14T19:25:45-03:00 logger.go:66: aws_subnet.subnet2: Still creating... [10s elapsed]
TestTerraformHttpExample 2021-03-14T19:25:49-03:00 logger.go:66: aws_subnet.subnet1: Creation complete after 15s [id=subnet-0fffdec4421734ebe]
TestTerraformHttpExample 2021-03-14T19:25:49-03:00 logger.go:66: aws_instance.ec2_1: Creating...
TestTerraformHttpExample 2021-03-14T19:25:49-03:00 logger.go:66: aws_subnet.subnet2: Creation complete after 15s [id=subnet-05f334555135f60b1]
TestTerraformHttpExample 2021-03-14T19:25:50-03:00 logger.go:66: aws_instance.ec2_2: Creating...
TestTerraformHttpExample 2021-03-14T19:25:59-03:00 logger.go:66: aws_instance.ec2_1: Still creating... [10s elapsed]
TestTerraformHttpExample 2021-03-14T19:26:00-03:00 logger.go:66: aws_instance.ec2_2: Still creating... [10s elapsed]
TestTerraformHttpExample 2021-03-14T19:26:09-03:00 logger.go:66: aws_instance.ec2_1: Still creating... [20s elapsed]
TestTerraformHttpExample 2021-03-14T19:26:10-03:00 logger.go:66: aws_instance.ec2_2: Still creating... [20s elapsed]
TestTerraformHttpExample 2021-03-14T19:26:19-03:00 logger.go:66: aws_instance.ec2_1: Creation complete after 29s [id=i-01861111f9d3a1491]
TestTerraformHttpExample 2021-03-14T19:26:19-03:00 logger.go:66: aws_alb_target_group_attachment.tg-ec2-1: Creating...
TestTerraformHttpExample 2021-03-14T19:26:20-03:00 logger.go:66: aws_instance.ec2_2: Still creating... [30s elapsed]
TestTerraformHttpExample 2021-03-14T19:26:20-03:00 logger.go:66: aws_alb_target_group_attachment.tg-ec2-1: Creation complete after 1s [id=arn:aws:elasticloadbalancing:us-west-2:626750626703:targetgroup/alb-group/6fe689ffec7813a9-20210314222620268500000001]
TestTerraformHttpExample 2021-03-14T19:26:30-03:00 logger.go:66: aws_instance.ec2_2: Still creating... [40s elapsed]
TestTerraformHttpExample 2021-03-14T19:26:30-03:00 logger.go:66: aws_instance.ec2_2: Creation complete after 40s [id=i-0bceb2bf7074e29eb]
TestTerraformHttpExample 2021-03-14T19:26:30-03:00 logger.go:66: aws_alb_target_group_attachment.tg-ec2-2: Creating...
TestTerraformHttpExample 2021-03-14T19:26:30-03:00 logger.go:66: aws_alb.alb: Creating...
TestTerraformHttpExample 2021-03-14T19:26:31-03:00 logger.go:66: aws_alb_target_group_attachment.tg-ec2-2: Creation complete after 1s [id=arn:aws:elasticloadbalancing:us-west-2:626750626703:targetgroup/alb-group/6fe689ffec7813a9-20210314222631094500000002]
TestTerraformHttpExample 2021-03-14T19:26:40-03:00 logger.go:66: aws_alb.alb: Still creating... [10s elapsed]
TestTerraformHttpExample 2021-03-14T19:26:50-03:00 logger.go:66: aws_alb.alb: Still creating... [20s elapsed]
TestTerraformHttpExample 2021-03-14T19:27:00-03:00 logger.go:66: aws_alb.alb: Still creating... [30s elapsed]
TestTerraformHttpExample 2021-03-14T19:27:10-03:00 logger.go:66: aws_alb.alb: Still creating... [40s elapsed]
TestTerraformHttpExample 2021-03-14T19:27:20-03:00 logger.go:66: aws_alb.alb: Still creating... [50s elapsed]
TestTerraformHttpExample 2021-03-14T19:27:30-03:00 logger.go:66: aws_alb.alb: Still creating... [1m0s elapsed]
TestTerraformHttpExample 2021-03-14T19:27:40-03:00 logger.go:66: aws_alb.alb: Still creating... [1m10s elapsed]
TestTerraformHttpExample 2021-03-14T19:27:50-03:00 logger.go:66: aws_alb.alb: Still creating... [1m20s elapsed]
TestTerraformHttpExample 2021-03-14T19:28:00-03:00 logger.go:66: aws_alb.alb: Still creating... [1m30s elapsed]
TestTerraformHttpExample 2021-03-14T19:28:10-03:00 logger.go:66: aws_alb.alb: Still creating... [1m40s elapsed]
TestTerraformHttpExample 2021-03-14T19:28:20-03:00 logger.go:66: aws_alb.alb: Still creating... [1m50s elapsed]
TestTerraformHttpExample 2021-03-14T19:28:30-03:00 logger.go:66: aws_alb.alb: Still creating... [2m0s elapsed]
TestTerraformHttpExample 2021-03-14T19:28:40-03:00 logger.go:66: aws_alb.alb: Still creating... [2m10s elapsed]
TestTerraformHttpExample 2021-03-14T19:28:43-03:00 logger.go:66: aws_alb.alb: Creation complete after 2m13s [id=arn:aws:elasticloadbalancing:us-west-2:626750626703:loadbalancer/app/my-alb/1f1cc77fa9db6498]
TestTerraformHttpExample 2021-03-14T19:28:43-03:00 logger.go:66: aws_alb_listener.alb_listener: Creating...
TestTerraformHttpExample 2021-03-14T19:28:44-03:00 logger.go:66: aws_alb_listener.alb_listener: Creation complete after 2s [id=arn:aws:elasticloadbalancing:us-west-2:626750626703:listener/app/my-alb/1f1cc77fa9db6498/f0a248b83d9e5786]
TestTerraformHttpExample 2021-03-14T19:28:44-03:00 logger.go:66:
TestTerraformHttpExample 2021-03-14T19:28:44-03:00 logger.go:66: Apply complete! Resources: 15 added, 0 changed, 0 destroyed.
TestTerraformHttpExample 2021-03-14T19:28:44-03:00 logger.go:66:
TestTerraformHttpExample 2021-03-14T19:28:44-03:00 logger.go:66: Outputs:
TestTerraformHttpExample 2021-03-14T19:28:44-03:00 logger.go:66:
TestTerraformHttpExample 2021-03-14T19:28:44-03:00 logger.go:66: alb_dns_name = my-alb-472968494.us-west-2.elb.amazonaws.com
TestTerraformHttpExample 2021-03-14T19:28:44-03:00 logger.go:66: instance_id1 = i-01861111f9d3a1491
TestTerraformHttpExample 2021-03-14T19:28:44-03:00 logger.go:66: instance_id2 = i-0bceb2bf7074e29eb
TestTerraformHttpExample 2021-03-14T19:28:44-03:00 retry.go:91: terraform [output -no-color -json alb_dns_name]
TestTerraformHttpExample 2021-03-14T19:28:44-03:00 logger.go:66: Running command terraform with args [output -no-color -json alb_dns_name]
TestTerraformHttpExample 2021-03-14T19:28:48-03:00 logger.go:66: "my-alb-472968494.us-west-2.elb.amazonaws.com"
TestTerraformHttpExample 2021-03-14T19:28:58-03:00 retry.go:91: Calling http://my-alb-472968494.us-west-2.elb.amazonaws.com
TestTerraformHttpExample 2021-03-14T19:28:58-03:00 http_helper.go:32: Making an HTTP GET call to URL http://my-alb-472968494.us-west-2.elb.amazonaws.com
TestTerraformHttpExample 2021-03-14T19:28:58-03:00 terraform_test.go:85: Got expected status code 200 from URL http://my-alb-472968494.us-west-2.elb.amazonaws.com
TestTerraformHttpExample 2021-03-14T19:28:58-03:00 terraform_test.go:86: Body was i-0bceb2bf7074e29eb
TestTerraformHttpExample 2021-03-14T19:28:58-03:00 retry.go:91: terraform [destroy -auto-approve -input=false -lock=false]
TestTerraformHttpExample 2021-03-14T19:28:58-03:00 logger.go:66: Running command terraform with args [destroy -auto-approve -input=false -lock=false]
TestTerraformHttpExample 2021-03-14T19:29:05-03:00 logger.go:66: data.template_file.client1: Refreshing state... [id=99b0ca2e0d4d700188fb457418a3139828c0828eaa22d55dee1dbee20e787d8f]
TestTerraformHttpExample 2021-03-14T19:29:05-03:00 logger.go:66: data.template_file.client2: Refreshing state... [id=99b0ca2e0d4d700188fb457418a3139828c0828eaa22d55dee1dbee20e787d8f]
TestTerraformHttpExample 2021-03-14T19:29:05-03:00 logger.go:66: tls_private_key.privatekey: Refreshing state... [id=8f2e3adc9f94d0911d672707f99b21e3f30b01a7]
TestTerraformHttpExample 2021-03-14T19:29:05-03:00 logger.go:66: data.template_cloudinit_config.config1: Refreshing state... [id=1478609727]
TestTerraformHttpExample 2021-03-14T19:29:05-03:00 logger.go:66: data.template_cloudinit_config.config2: Refreshing state... [id=1478609727]
TestTerraformHttpExample 2021-03-14T19:29:08-03:00 logger.go:66: aws_key_pair.generated_key: Refreshing state... [id=keys]
TestTerraformHttpExample 2021-03-14T19:29:08-03:00 logger.go:66: aws_vpc.VPC: Refreshing state... [id=vpc-0564116a4f9b39b1c]
TestTerraformHttpExample 2021-03-14T19:29:16-03:00 logger.go:66: aws_internet_gateway.default: Refreshing state... [id=igw-03eb2a4a72e6dccc4]
TestTerraformHttpExample 2021-03-14T19:29:16-03:00 logger.go:66: aws_subnet.subnet1: Refreshing state... [id=subnet-0fffdec4421734ebe]
TestTerraformHttpExample 2021-03-14T19:29:16-03:00 logger.go:66: aws_subnet.subnet2: Refreshing state... [id=subnet-05f334555135f60b1]
TestTerraformHttpExample 2021-03-14T19:29:16-03:00 logger.go:66: aws_alb_target_group.alb_target: Refreshing state... [id=arn:aws:elasticloadbalancing:us-west-2:626750626703:targetgroup/alb-group/6fe689ffec7813a9]
TestTerraformHttpExample 2021-03-14T19:29:16-03:00 logger.go:66: aws_security_group.ec2_sg: Refreshing state... [id=sg-054b35623529fb7c6]
TestTerraformHttpExample 2021-03-14T19:29:17-03:00 logger.go:66: aws_instance.ec2_2: Refreshing state... [id=i-0bceb2bf7074e29eb]
TestTerraformHttpExample 2021-03-14T19:29:17-03:00 logger.go:66: aws_instance.ec2_1: Refreshing state... [id=i-01861111f9d3a1491]
TestTerraformHttpExample 2021-03-14T19:29:17-03:00 logger.go:66: aws_route.internet_access: Refreshing state... [id=r-rtb-09dcd8d2579cf276c1080289494]
TestTerraformHttpExample 2021-03-14T19:29:22-03:00 logger.go:66: aws_alb_target_group_attachment.tg-ec2-2: Refreshing state... [id=arn:aws:elasticloadbalancing:us-west-2:626750626703:targetgroup/alb-group/6fe689ffec7813a9-20210314222631094500000002]
TestTerraformHttpExample 2021-03-14T19:29:22-03:00 logger.go:66: aws_alb_target_group_attachment.tg-ec2-1: Refreshing state... [id=arn:aws:elasticloadbalancing:us-west-2:626750626703:targetgroup/alb-group/6fe689ffec7813a9-20210314222620268500000001]
TestTerraformHttpExample 2021-03-14T19:29:22-03:00 logger.go:66: aws_alb.alb: Refreshing state... [id=arn:aws:elasticloadbalancing:us-west-2:626750626703:loadbalancer/app/my-alb/1f1cc77fa9db6498]
TestTerraformHttpExample 2021-03-14T19:29:25-03:00 logger.go:66: aws_alb_listener.alb_listener: Refreshing state... [id=arn:aws:elasticloadbalancing:us-west-2:626750626703:listener/app/my-alb/1f1cc77fa9db6498/f0a248b83d9e5786]
TestTerraformHttpExample 2021-03-14T19:29:32-03:00 logger.go:66: aws_alb_target_group_attachment.tg-ec2-1: Destroying... [id=arn:aws:elasticloadbalancing:us-west-2:626750626703:targetgroup/alb-group/6fe689ffec7813a9-20210314222620268500000001]
TestTerraformHttpExample 2021-03-14T19:29:32-03:00 logger.go:66: aws_alb_target_group_attachment.tg-ec2-2: Destroying... [id=arn:aws:elasticloadbalancing:us-west-2:626750626703:targetgroup/alb-group/6fe689ffec7813a9-20210314222631094500000002]
TestTerraformHttpExample 2021-03-14T19:29:32-03:00 logger.go:66: aws_route.internet_access: Destroying... [id=r-rtb-09dcd8d2579cf276c1080289494]
TestTerraformHttpExample 2021-03-14T19:29:32-03:00 logger.go:66: aws_alb_listener.alb_listener: Destroying... [id=arn:aws:elasticloadbalancing:us-west-2:626750626703:listener/app/my-alb/1f1cc77fa9db6498/f0a248b83d9e5786]
TestTerraformHttpExample 2021-03-14T19:29:33-03:00 logger.go:66: aws_alb_target_group_attachment.tg-ec2-1: Destruction complete after 1s
TestTerraformHttpExample 2021-03-14T19:29:33-03:00 logger.go:66: aws_route.internet_access: Destruction complete after 1s
TestTerraformHttpExample 2021-03-14T19:29:33-03:00 logger.go:66: aws_internet_gateway.default: Destroying... [id=igw-03eb2a4a72e6dccc4]
TestTerraformHttpExample 2021-03-14T19:29:33-03:00 logger.go:66: aws_alb_target_group_attachment.tg-ec2-2: Destruction complete after 1s
TestTerraformHttpExample 2021-03-14T19:29:33-03:00 logger.go:66: aws_alb_listener.alb_listener: Destruction complete after 1s
TestTerraformHttpExample 2021-03-14T19:29:33-03:00 logger.go:66: aws_alb_target_group.alb_target: Destroying... [id=arn:aws:elasticloadbalancing:us-west-2:626750626703:targetgroup/alb-group/6fe689ffec7813a9]
TestTerraformHttpExample 2021-03-14T19:29:33-03:00 logger.go:66: aws_alb.alb: Destroying... [id=arn:aws:elasticloadbalancing:us-west-2:626750626703:loadbalancer/app/my-alb/1f1cc77fa9db6498]
TestTerraformHttpExample 2021-03-14T19:29:34-03:00 logger.go:66: aws_alb_target_group.alb_target: Destruction complete after 1s
TestTerraformHttpExample 2021-03-14T19:29:37-03:00 logger.go:66: aws_alb.alb: Destruction complete after 4s
TestTerraformHttpExample 2021-03-14T19:29:37-03:00 logger.go:66: aws_instance.ec2_1: Destroying... [id=i-01861111f9d3a1491]
TestTerraformHttpExample 2021-03-14T19:29:37-03:00 logger.go:66: aws_instance.ec2_2: Destroying... [id=i-0bceb2bf7074e29eb]
TestTerraformHttpExample 2021-03-14T19:29:43-03:00 logger.go:66: aws_internet_gateway.default: Still destroying... [id=igw-03eb2a4a72e6dccc4, 10s elapsed]
TestTerraformHttpExample 2021-03-14T19:29:47-03:00 logger.go:66: aws_instance.ec2_1: Still destroying... [id=i-01861111f9d3a1491, 10s elapsed]
TestTerraformHttpExample 2021-03-14T19:29:47-03:00 logger.go:66: aws_instance.ec2_2: Still destroying... [id=i-0bceb2bf7074e29eb, 10s elapsed]
TestTerraformHttpExample 2021-03-14T19:29:53-03:00 logger.go:66: aws_internet_gateway.default: Still destroying... [id=igw-03eb2a4a72e6dccc4, 20s elapsed]
TestTerraformHttpExample 2021-03-14T19:29:57-03:00 logger.go:66: aws_instance.ec2_2: Still destroying... [id=i-0bceb2bf7074e29eb, 20s elapsed]
TestTerraformHttpExample 2021-03-14T19:29:57-03:00 logger.go:66: aws_instance.ec2_1: Still destroying... [id=i-01861111f9d3a1491, 20s elapsed]
TestTerraformHttpExample 2021-03-14T19:30:01-03:00 logger.go:66: aws_internet_gateway.default: Destruction complete after 27s
TestTerraformHttpExample 2021-03-14T19:30:07-03:00 logger.go:66: aws_instance.ec2_2: Still destroying... [id=i-0bceb2bf7074e29eb, 30s elapsed]
TestTerraformHttpExample 2021-03-14T19:30:07-03:00 logger.go:66: aws_instance.ec2_1: Still destroying... [id=i-01861111f9d3a1491, 30s elapsed]
TestTerraformHttpExample 2021-03-14T19:30:11-03:00 logger.go:66: aws_instance.ec2_1: Destruction complete after 34s
TestTerraformHttpExample 2021-03-14T19:30:11-03:00 logger.go:66: aws_instance.ec2_2: Destruction complete after 34s
TestTerraformHttpExample 2021-03-14T19:30:11-03:00 logger.go:66: aws_subnet.subnet2: Destroying... [id=subnet-05f334555135f60b1]
TestTerraformHttpExample 2021-03-14T19:30:11-03:00 logger.go:66: aws_subnet.subnet1: Destroying... [id=subnet-0fffdec4421734ebe]
TestTerraformHttpExample 2021-03-14T19:30:11-03:00 logger.go:66: aws_key_pair.generated_key: Destroying... [id=keys]
TestTerraformHttpExample 2021-03-14T19:30:11-03:00 logger.go:66: aws_security_group.ec2_sg: Destroying... [id=sg-054b35623529fb7c6]
TestTerraformHttpExample 2021-03-14T19:30:12-03:00 logger.go:66: aws_key_pair.generated_key: Destruction complete after 1s
TestTerraformHttpExample 2021-03-14T19:30:12-03:00 logger.go:66: tls_private_key.privatekey: Destroying... [id=8f2e3adc9f94d0911d672707f99b21e3f30b01a7]
TestTerraformHttpExample 2021-03-14T19:30:12-03:00 logger.go:66: tls_private_key.privatekey: Destruction complete after 0s
TestTerraformHttpExample 2021-03-14T19:30:13-03:00 logger.go:66: aws_security_group.ec2_sg: Destruction complete after 2s
TestTerraformHttpExample 2021-03-14T19:30:13-03:00 logger.go:66: aws_subnet.subnet1: Destruction complete after 2s
TestTerraformHttpExample 2021-03-14T19:30:13-03:00 logger.go:66: aws_subnet.subnet2: Destruction complete after 2s
TestTerraformHttpExample 2021-03-14T19:30:13-03:00 logger.go:66: aws_vpc.VPC: Destroying... [id=vpc-0564116a4f9b39b1c]
TestTerraformHttpExample 2021-03-14T19:30:14-03:00 logger.go:66: aws_vpc.VPC: Destruction complete after 1s
TestTerraformHttpExample 2021-03-14T19:30:14-03:00 logger.go:66:
TestTerraformHttpExample 2021-03-14T19:30:14-03:00 logger.go:66: Destroy complete! Resources: 15 destroyed.
--- PASS: TestTerraformHttpExample (324.38s)
PASS
ok      example.com/mod 324.659s
```

## TerraTest expected result for Test 1

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
