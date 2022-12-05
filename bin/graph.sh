#!/bin/bash

cd ~/workspace/posts_graphql || exit
rails graphql:schema:dump

cd frontend/ || exit
npx apollo service:download --endpoint=http://localhost:5000/graphql schema.json
npx apollo service:download --endpoint=http://localhost:5000/graphql schema.graphql
find . -name "__generated__" -exec rm -rf '{}' + # remove all __generated__ directories
npx apollo codegen:generate --localSchemaFile=schema.json --target=typescript --tagName=gql

cd ~/workspace/posts_graphql || exit