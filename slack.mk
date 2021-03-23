# slack notifications

project := $(shell basename $$(pwd))
commit_title := $(shell git log -1 --pretty=%B |head -n1)

define send_slack_msg
	curl -X POST -H 'Content-type: application/json' --data '{"text":$(1)}' $(int_slack_url)
endef

ci_notify_start:
	$(call send_slack_msg,"🛠️ building $(project):$(git_rev) $(step_url)")

ci_notify_failure:
	$(call send_slack_msg,"💣 failed building $(project):$(git_rev)")

ci_notify_complete:
	$(call send_slack_msg,"👍 build OK! $(project):$(git_rev)\n $(commit_title)")

print_project:
	@echo $(project)
