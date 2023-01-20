# Markdown-to-Postgres

Quick and dirty bash script for loading Markdown files from a directory into a Postgres table.

Uses Markdown Front Matter to load additional metadata into table columns.

The bash script will need to be updated for specific use cases. \
Good for use with `docker-entrypoint-initdb.d` of the Postgres docker container.

## Example
[![Open in Gitpod](https://gitpod.io/button/open-in-gitpod.svg)](https://gitpod.io/#https://github.com/m-rgba/markdown-to-postgres)

### Local Usage
```
docker-compose up
```

---

- SQL migration and bash script are mounted to run on container startup in `docker-entrypoint-initdb.d`.
- `001-post.sql` > runs the migration to create the `post` table.
- `002-markdown-loader.sh` > takes the Markdown files mounted at `/markdown`, parses them, and uses PSQL to load each one into the `post` table.