FROM node:19.9-alpine3.17 AS build
LABEL maintainer="reyland.dev"
WORKDIR /build

COPY ./package.json /build

RUN npm install

COPY . /build/

RUN npm run build

FROM nginx:1.24.0-alpine3.17-slim
LABEL maintainer="reyland.dev"
EXPOSE 7070

COPY --from=build /build/dist/ /html/
