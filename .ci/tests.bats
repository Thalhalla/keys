#!/usr/bin/env bats

@test ".ci/test_all_pubs" {
  run bash .ci/test_all_pubs
  [ "$status" -eq 0 ]
}
