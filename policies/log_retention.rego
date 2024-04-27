package terraform.policies.tags
import input.plan as tfplan


check_log_retention[msg]{

    rc:=tfplan.planned_values
    child_mod:=rc.root_module.child_modules
    rsb:=child_mod[_].resources[_]

    rsb.type=="aws_cloudwatch_log_group"
    not rsb.values.retention_in_days =90
    msg:=sprintf("retention is not set to 90 day on the resource %v",[rsb.type])
}


deny[msg]{
    msg := check_log_retention[_]
}
