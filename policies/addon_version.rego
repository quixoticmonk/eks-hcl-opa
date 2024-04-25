package terraform.policies.addon_version
import input.plan as tfplan


import data.policies.common.addon_version

res:=tfplan.planned_values.root_module.resources    
ret:=[r|r:=res[_];r.type=="aws_eks_addon";r.mode=="managed"]

check_addon_version[msg]{
    msg := sprintf(" Addon version is %v",[ret[_].values.addon_version])
    ret[_].values.addon_version != addon_version
}

deny[msg]{
    msg := check_addon_version[_]
}
