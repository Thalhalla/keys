heimdall.ign:
	ct \
		< heimdall.yaml \
		> heimdall.ign

test:
	bats .ci/tests.bats
