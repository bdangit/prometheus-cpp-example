source "${BATS_TEST_DIRNAME}/../habitat/plan.sh"

@test "Command is on path" {
  [ "$(command -v myapp)" ]
}

@test "Service is running" {
  [ "$(hab svc status | grep "prometheus-cpp-example\.default" | awk '{print $4}' | grep up)" ]
}

@test "Listening on port 8080" {
  result="$(netstat -peanut | grep myapp | awk '{print $4}' | awk -F':' '{print $2}')"
  [ "${result}" -eq 8080 ]
}