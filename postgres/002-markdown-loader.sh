#!/bin/bash

# Where's the markdown > where should it be inserted?
markdown_dir=/markdown
table_name=post

for file in $markdown_dir/*.md; do
    # Note: sed "s/'/''/g" is a hack to escape single quotes in the content

    # Extract everything after headmatter titles
    title=$(grep -m 1 -Po 'title: \K.*' $file | sed "s/'/''/g")
    publish_date=$(grep -m 1 -Po 'publish_date: \K.*' $file | sed "s/'/''/g")
    # Everything line-6 and below (first row of content)
    content=$(sed -n '6,$p' $file | sed "s/'/''/g")

    # Insert into table
    psql -U ${POSTGRES_USER} -c "INSERT INTO $table_name (title, publish_date, content) VALUES ('$title', '$publish_date', '$content');"    
done