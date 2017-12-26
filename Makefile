SWAGGER=java -jar swagger-codegen-cli.jar

build:
	gprbuild -p -Ptodos

generate:
	$(SWAGGER) generate -l ada-server -i todo.yaml -DprojectName=todos --model-package Todos
