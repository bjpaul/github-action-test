package policy.terraform

import rego.v1

is_deleting_resource(resource_changes) := true if {
    some item in resource_changes
    some action in item.change.actions
    action == "delete"
}