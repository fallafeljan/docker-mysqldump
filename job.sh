#!/bin/sh
DATE=`date +%Y-%m-%d_%H-%M-%S`
FILE="blog-${DATE}.sql"

{
  mysqldump -uroot -h $MYSQL_HOST $MYSQL_DATABASE \
    | mc pipe "storage/${S3_BUCKET}/${FILE}" \
    && echo "Created backup: ${FILE}"
} || {
  curl -X POST \
    -H 'Content-type: application/json' \
    --data '{"text": "Backup failed."}' \
    $WEBHOOK_URL
}
