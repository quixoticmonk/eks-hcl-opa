package terraform.policies.addon_cluster
import input.plan as tfplan

import data.policies.common.cluster_name

addon_version="v0.1.8-eksbuid.1"
addon_type:="new-relic_kubernetes-operator"
cluster_name:="marketplace-webinar"

res:=tfplan.planned_values.root_module.resources    
ret:=[r|r:=res[_];r.type=="aws_eks_addon";r.mode=="managed"]


check_cluster_name[msg] {
    msg := sprintf(" Cluster name is %v",[ret[_].values.cluster_name])
    ret[_].values.cluster_name != cluster_name
}

deny[msg]{
    msg := check_cluster_name[_]
}