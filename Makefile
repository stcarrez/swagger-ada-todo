SWAGGER=java -jar openapi-generator-cli.jar

build:
	gprbuild -p -Ptodos

generate:
	$(SWAGGER) generate --generator-name ada -i todo.yaml --additional-properties projectName=todos --model-package Todos -o .
	$(SWAGGER) generate --generator-name ada-server -i todo.yaml --additional-properties projectName=todos --model-package Todos -o .
