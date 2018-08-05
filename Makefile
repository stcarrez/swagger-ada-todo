SWAGGER=java -jar openapi-generator-cli.jar

build:
	gprbuild -p -Ptodos

generate:
	$(SWAGGER) generate --generator-name ada -i todo.yaml -DprojectName=todos --model-package Todos
	$(SWAGGER) generate --generator-name ada-server -i todo.yaml -DprojectName=todos --model-package Todos
