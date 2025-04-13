package terraform.analysis

import rego.v1
import data.policy.terraform

default authz := false

authz := true if {
    not terraform.is_deleting_resource(input.resource_changes)
}