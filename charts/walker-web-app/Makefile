

all: test

test:
	helm template test . --set github_org=mw-do --set repo_name=reponame --set lifecycle=dev --set db_project_id=db-project --set app_code=test --set domain=example.com --set app_project_id=app-project
