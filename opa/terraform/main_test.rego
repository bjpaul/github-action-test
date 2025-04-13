package test.main

import rego.v1
import data.terraform.analysis

test_deleting_resource if {
    testing_input := {
        "resource_changes": [
            {
                "change": {
                    "actions": ["delete","update"]
                }
            }
        ]
    }

    analysis.authz == false
        with input as testing_input
}

test_non_deleting_action if {
    testing_input := {
        "resource_changes": [
            {
                "change": {
                    "actions": ["create","update"]
                }
            }
        ]
    }

    analysis.authz == true
        with input as testing_input
}
