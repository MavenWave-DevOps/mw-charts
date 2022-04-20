

all: test

test:
	helm template test . --set lifecycle=dev --set db_project_id=db-project --set app_code=test --set domain=example.com --set app_project_id=app-project --set tenant_code=team1
