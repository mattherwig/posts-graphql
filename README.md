# Read Me

<!-- TOC -->
* [Reference Material](#reference-material)
* [Server Setup](#server-setup)
* [Client Setup](#client-setup)
<!-- TOC -->

### Reference Material

Based slightly on these tutorials but expanded further.
- [Running a Rails server with GraphQL and GraphiQL](https://www.agiliq.com/blog/2020/04/running-rails-server-with-graphql-and-graphiql/)
- [Rails + GraphQL and React](https://www.agiliq.com/blog/2020/05/rails-graphql-and-react/)

### Server Setup

Setup the server:
```shell
bundle install
```

Start the server:
```shell
rails s --port 5000
```

Run Queries Locally:
```
http://localhost:5000/graphiql
```


### Client Setup

Setup the client:
```shell
cd frontend/
yarn install
```

Start the client:
```shell
cd frontend/
yarn start
```