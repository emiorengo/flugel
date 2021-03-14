package test

import (
	"testing"
	"fmt"
	"time"

	//"github.com/gruntwork-io/terratest/modules/aws"
	"github.com/gruntwork-io/terratest/modules/terraform"
	//"github.com/stretchr/testify/assert"
	http_helper "github.com/gruntwork-io/terratest/modules/http-helper"
	"github.com/gruntwork-io/terratest/modules/logger"
	"github.com/gruntwork-io/terratest/modules/retry"
)
/*
###############################################################################
#################################  Test1  #####################################
###############################################################################

func TestTerraform(t *testing.T) {

	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "./",
	})

	defer terraform.Destroy(t, terraformOptions)

	terraform.InitAndApply(t, terraformOptions)

  expectedName := terraform.Output(t, terraformOptions, "bucket_id")
	// Verify that our Bucket has the tag Name=Flugel
	actualBucketNameByTagName := aws.FindS3BucketWithTag(t, "us-west-2", "Name", "Flugel")
	assert.Equal(t, actualBucketNameByTagName, expectedName)

	// Verify that our Bucket has the tag Owner=InfraTeam
	actualBucketNameByTagOwner := aws.FindS3BucketWithTag(t, "us-west-2", "Owner", "InfraTeam")
	assert.Equal(t, actualBucketNameByTagOwner, expectedName)

  // Run `terraform output` to get the value of an output variable
  instanceID := terraform.Output(t, terraformOptions, "instance_id")

	// Look up the tags for the given Instance ID
	instanceTags := aws.GetTagsForEc2Instance(t, "us-west-2", instanceID)

	// Verify that our EC2 has the tag Name=Flugel
	NameTag, containsNameTag := instanceTags["Name"]
	assert.True(t, containsNameTag)
	assert.Equal(t, "Flugel", NameTag)

	// Verify that our EC2 has the tag Owner=InfraTeam
	ownerTag, containsOwnerTag := instanceTags["Owner"]
	assert.True(t, containsOwnerTag)
	assert.Equal(t, "InfraTeam", ownerTag)

}
*/
//##############################################################################
//################################  Test2  #####################################
//##############################################################################

func TestTerraformHttpExample(t *testing.T) {
	t.Parallel()

	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "./",
	})

	defer terraform.Destroy(t, terraformOptions)

	terraform.InitAndApply(t, terraformOptions)

  // Run `terraform output` to get the value of the ALB DNS
	alb_dns_name := terraform.Output(t, terraformOptions, "alb_dns_name")
  // Add http
	instanceURL := "http://" + alb_dns_name
  // Expected status code
  expectedStatus := 200
	actionDescription := fmt.Sprintf("Calling %s", instanceURL)
	//Have to wait some secs to get the ALB ready
	time.Sleep(10 * time.Second)
	// Verify status 200 to the ALB
	retry.DoWithRetry(t, actionDescription, 10, 10 * time.Second, func() (string, error) {
      statusCode, body := http_helper.HttpGet(t, instanceURL, nil)
      if statusCode == expectedStatus {
         logger.Logf(t, "Got expected status code %d from URL %s", expectedStatus, instanceURL)
         logger.Logf(t, "Body was %s", body)
				 return "", nil
      }
			return "", fmt.Errorf("got status %d instead of the expected %d from %s", statusCode, expectedStatus, instanceURL)
   })
}
