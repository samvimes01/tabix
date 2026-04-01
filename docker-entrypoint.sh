#!/bin/sh
cat <<EOF > /public/config.js
window.__TABIX_CONFIG__ = {
  DEFAULT_CONNECTION_URL: "${DEFAULT_CONNECTION_URL:-}",
  DEFAULT_CONNECTION_USER: "${DEFAULT_CONNECTION_USER:-}",
  DEFAULT_CONNECTION_PASSWORD: "${DEFAULT_CONNECTION_PASSWORD:-}",
  DEFAULT_CONNECTION_NAME: "${DEFAULT_CONNECTION_NAME:-}"
};
EOF

exec static-web-server --port 80 --root /public --page-fallback index.html
