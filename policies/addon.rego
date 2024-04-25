package terraform.policies.addon
import input.plan as tfplan


addon_version="v0.1.8-eksbuid.1"
addon_type:="new-relic_kubernetes-operator"
cluster_name:="marketplace-webinar"

res:=tfplan.planned_values.root_module.resources    
ret:=[r|r:=res[_];r.type=="aws_eks_addon";r.mode=="managed"]

check_addon_version[msg]{
    msg := sprintf(" Addon version is %v",[ret[_].values.addon_version])
    ret[_].values.addon_version != addon_version
}

check_addon_type[msg] {
    msg := sprintf(" Addon name is %v",[ret[_].values.addon_name])
    ret[_].values.addon_name != addon_type
}

check_cluster_name[msg] {
    msg := sprintf(" Cluster name is %v",[ret[_].values.cluster_name])
    ret[_].values.cluster_name != cluster_name
}

deny[msg]{
    msg := check_addon_version[_]
}

deny[msg]{
    msg := check_addon_type[_]
}

deny[msg]{
    msg := check_cluster_name[_]
}