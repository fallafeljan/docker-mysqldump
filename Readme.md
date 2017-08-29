# docker-mysqldump 📦

Create classic `mysqldump` backups of your MySQL database containers using S3 storage as backend. This container needs to be attached to the respective container. Internally, it uses [`minio/mc`](https://hub.docker.com/r/minio/mc/) for accessing the object storage.


## Getting Started

Several environment variables are required:
* `S3_ENDPOINT`
* `S3_BUCKET`
* `S3_ACCESS_KEY`
* `S3_SECRET_KEY`
* `MYSQL_ROOT_PASSWORD`
* `MYSQL_HOST`
* `MYSQL_DATABASE`
