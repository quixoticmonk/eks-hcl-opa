package terraform.policies.addon_version
import input.plan as tfplan

import future.keywords

check_eks_addons[msg]{

    rc:=tfplan.planned_values
    child_mod:=rc.root_module.child_modules
    rsb:=child_mod[_].resources[_]

    rsb.type=="aws_eks_addon"
    not rsb.values.addon_name in {"vpc-cni","coredns","kube-proxy"}
    msg:=sprintf("addon name %v doesn't match accepted list",[rsb.values.addon_name])

}

deny[msg]{
    msg := check_eks_addons[_]
}
