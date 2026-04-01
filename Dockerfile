FROM node:20.20-slim AS build

WORKDIR /app

RUN corepack enable

COPY package.json yarn.lock ./
RUN cat <<EOF > .yarnrc.yml
nodeLinker: node-modules
EOF
RUN yarn install
COPY . .
ENV SKIP_TS_CHECK=1
RUN npx webpack --mode production --color --progress --config webpack.config.babel.js

FROM joseluisq/static-web-server:2-alpine AS prod

WORKDIR /public
COPY --from=build /app/dist/ .
COPY docker-entrypoint.sh /docker-entrypoint.sh

EXPOSE 80
ENTRYPOINT ["/docker-entrypoint.sh"]
