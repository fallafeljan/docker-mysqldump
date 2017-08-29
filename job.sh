#!/bin/sh
DATE=`date +%Y-%m-%d`

mysqldump -uroot -h $MYSQL_HOST $MYSQL_TABLE \
  | mc pipe "storage/${S3_BUCKET}/blog-${DATE}.sql"
