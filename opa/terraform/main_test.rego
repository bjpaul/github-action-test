package test.main

import rego.v1
import data.main

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

    main.is_allowed == false
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

    main.is_allowed == true
        with input as testing_input
}
