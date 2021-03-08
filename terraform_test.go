package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/aws"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

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
