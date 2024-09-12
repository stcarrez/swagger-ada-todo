ALR?=alr --non-interactive
OPENAPI=$(ALR) exec -- openapi-generator
OPENAPI_OPTIONS=--additional-properties projectName=todos \
                --additional-properties openApiName=OpenAPI \
                --additional-properties httpSupport=Curl \
                --model-package Todos -o .

build:
	$(ALR) build

generate:
	$(OPENAPI) generate --generator-name ada -i todo.yaml $(OPENAPI_OPTIONS)
	$(OPENAPI) generate --generator-name ada-server -i todo.yaml $(OPENAPI_OPTIONS)
