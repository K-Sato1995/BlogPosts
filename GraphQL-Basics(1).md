# Introduction
One of the projects that I involved with at work used GraphQl and I spent a decent amount of time learning the basic concept of the tool and how to actually use it in applications. I am writing this post so that I can retain my knowledge of the technology and use it in my personal projects in the future.
This post will mainly focus on the basic concept of `GraphQL` and how to use it on the front-end of your application.

# Table of contents
1. [Basic concept](#basic-concept)
- [Query](#query)
- [GraphQL is just a query language specification](#graphql-is-just-a-query-language-specification)
- [Variables](#variables)
- [Mutations](#mutations)
- [Introspection](#introspection)
- [References](#references)

## Basic concept
GraphQL allows the client to specify exactly what it needs, avoiding over‐fetching and under‐fetching of data.
GraphQL has two types of operations which are `Query` and `Mutation`.

## Query

```
query {
  client(id:1) {
    id
    name
  }
}
```

In the above code, `client` is the query operation. `(id: 1)` contains arguments that we want to be passed to the query.

The query above returns somthing like this.

```
{
  "data": {
    "client": {
      "id": "1",
      "name": "Steve Jobs"
    }
  }
}
```

## GraphQL is just a query language specification

GraphQL is just a query language specification. All operations, arguments that may be passed, and all available fields that may be used in the selection set have to be defined and implemented by __your GraphQL server__.

One of the principles that drive GraphQL specification is `strong-typing`.

Every GraphQL server defines an application‐specific `type` system. Queries are executed within the context of that type system.

That means that your selection set can query fields of Scalar type which are primitive types like `Int`, `Float`, `String`, `Boolean` and `ID`.


## Variables
If you want to reduce repetitions on our query statements, you can use `variables`.

```
{
  client(id:1) {
    name
  }
  
  products(client_id:1) {
    price
    quontity
    parts {
      name
      price
    }
  }
}
```
For instace, both `(id:1)` and `(client_id:1)` represent the same thing in the code above. You can reduce the repetition by using the variables like the code below.

```
query ($clientId: Int!) {
  client(id: $clientId) {
    name
  }
  products($clientId: Int!) {
    price
    quontity
    parts {
      name
      price
    }
  }
}
```

You can also specify a default value for a variable.

```
query ($clientId: Int! = "1") {
  client(id: $clientId) {
    name
  }
}
```

## Mutations
GraphQL uses `mutations` to create, update and delete data.

```
mutation {
  create_client(
    name: "Jack"
    age: "24"
  ){
    id
    name
    age
  }
}
```
We passed the arguments we wanted the new record to be saved with and, finally, our selection set is defining which fields we want to return after the record is created.
The query above would create a record like the code below.

```
{
  "data": {
    "create_client": {
      "id": "1",
      "name": "Jack",
      "age": "24"
    }
  }
}
```

You can update data like the query below.

```
mutation {
  update_client(
    id: 1
    age: "26"
  ){
    id
    name
    age
  }
}
```

The response would be like this.

```
{
  "data": {
    "create_client": {
      "id": "1",
      "name": "Jack",
      "age": "25"
    }
  }
}
```

If you want to delete the data, you can do so like the code below.

```
mutation {
  destroy_client (
    id: 1
  ){
    name
    age
  }
}
```

## Introspection
A great feature of GraphQL is the ability to query its own schema, allowing you to view many of its details like which query and mutation operations are available, which arguments they accept and even which available fields we can query.

For `queries`.

```
{
  __schema {
    queryType {
      name
      fields {
        name
      }
    }
  }
}
```

For `mutations`.

```
{
  __schema {
    mutationType {
      name
      fields {
        name
      }
    }
  }
}
```

## References
[OK GROW! - GraphQL Basics](https://www.okgrow.com/posts/graphql-basics)
