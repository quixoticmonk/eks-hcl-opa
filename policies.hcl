policy "friday_deploys" {
  query = "data.terraform.policies.friday_deploys.deny"
  enforcement_level = "mandatory"
}

policy "public_ingress" {
  query = "data.terraform.policies.public_ingress.deny"
  enforcement_level = "mandatory"
}


policy "check_addon_version" {
  query = "data.terraform.policies.check_addon_version.deny"
  enforcement_level = "mandatory"
}
