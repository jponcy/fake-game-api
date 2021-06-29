FROM node:alpine3.13 as game-api-base
LABEL maintainer="Jonathan Poncy <poncy.jonathan@gmail.com>" \
      version="0.1" \
      description="Build game-fake-api"
ADD package.json /app/
WORKDIR /app

# Build image.
FROM game-api-base as game-api-build
RUN npm install -g npm@7.19.0 && npm install --production --silent

# Final image -- execution.
FROM game-api-base
ADD assets/ /app
COPY --from=game-api-build /app/node_modules/ /app/node_modules
ARG file="separed.json"
ENV TARGET_FILE=$file
ENTRYPOINT [ "npx", "json-server", "${TARGET_FILE}" ]
CMD [ "--port", "8080", "--host", "0.0.0.0" ]
EXPOSE 8080
