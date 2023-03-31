package terraform
import future.keywords.contains
import future.keywords.if

default timeout = "failed timeout value"
default reserved_concurrent_executions = "failed reserved concurrent executions value"
default subnet_ids = "failed subnet_ids "

timeout if {
	needed := input.resource_changes[1]
	#175
	needed.change.after.timeout == 30 
}

reserved_concurrent_executions if {
	needed := input.resource_changes[1]
	#168
	needed.change.after.reserved_concurrent_executions == 10
}

subnet_ids if {
	needed := input.resource_changes[1]
	#181
	needed.change.after.vpc_config[0].subnet_ids[0] == "subnet-021d1fa4447a9db53"
}
