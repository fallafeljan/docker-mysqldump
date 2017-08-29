#!/bin/sh
mc config host add storage \
  ${S3_ENDPOINT} \
  ${S3_ACCESS_KEY} \
  ${S3_SECRET_KEY} \
  S3v4

cat <<EOF > $HOME/.my.cnf
[client]
password=${MYSQL_ROOT_PASSWORD}
EOF

exec "$@"
