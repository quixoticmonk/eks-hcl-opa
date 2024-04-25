package terraform.policies.addon_type
import input.plan as tfplan

import data.policies.common.addon_type


res:=tfplan.planned_values.root_module.resources    
ret:=[r|r:=res[_];r.type=="aws_eks_addon";r.mode=="managed"]

check_addon_type[msg] {
    msg := sprintf(" Addon name is %v",[ret[_].values.addon_name])
    ret[_].values.addon_name != addon_type
}


deny[msg]{
    msg := check_addon_type[_]
}