package terraform.policies.check_addon_version

import input.plan as tfplan

deny[msg] {
  r := tfplan.resource_changes[_]
  r.type == "aws_eks_addon"
  r.change.after.addon_version == "v0.1.8-eksbuild.1"
  msg := sprintf("eks addon version doesn't match")
}