### 1. stage: create build image
FROM ciceron/openapi-ada:latest AS openapi-todo-build

ENV BUILD_PREFIX /usr/src/openapi-todo

# Install build dependencies
RUN mkdir -p /usr/src \
   && export ADA_PROJECT_PATH=/usr/share/gpr \
   && cd /usr/src \
   && git clone https://github.com/stcarrez/swagger-ada-todo.git openapi-todo \
   && cd openapi-todo \
   && make -s

### 2. stage: create production image

FROM ubuntu:focal AS openapi-todo

ENV INSTALL_PREFIX /usr/openapi-todo
ENV BUILD_PREFIX /usr/src/openapi-todo

RUN apt-get update && \
    apt-get install -y libaws5

COPY --from=openapi-todo-build ${BUILD_PREFIX}/bin/ ${INSTALL_PREFIX}/bin/
COPY --from=openapi-todo-build ${BUILD_PREFIX}/web/ ${INSTALL_PREFIX}/web/
COPY --from=openapi-todo-build ${BUILD_PREFIX}/todos.properties ${INSTALL_PREFIX}/
COPY --from=openapi-todo-build ${BUILD_PREFIX}/client.properties ${INSTALL_PREFIX}/
COPY --from=openapi-todo-build /usr/share/openapi-ada /usr/share/openapi-ada

# CLI
EXPOSE 8080

WORKDIR ${INSTALL_PREFIX}
CMD ${INSTALL_PREFIX}/bin/todos-server
