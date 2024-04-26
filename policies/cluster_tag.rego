package terraform.policies.tags
import input.plan as tfplan

check_tag[msg]{
    rc:=tfplan.planned_values
    child_mod:=rc.root_module.child_modules
    rsb:=child_mod[_].resources[_]
    rsb.type=="aws_eks_cluster"
    not rsb.values.tags.create_by

    msg:=sprintf("create_by tag doesn't exist on the resource %v",[rsb.type])
}

deny[msg]{
    msg := check_tag[_]
}
