package terraform.policies.friday_deploys

deny[msg] {
  time.weekday(time.now_ns()) == "Tuesday"

  msg := "No deployments allowed on Tuesdays"
}
