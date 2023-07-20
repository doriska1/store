# Run project

## 1. Clone repository

> https://github.com/doriska1/store

## 2. Install gems

`bundle install`

## 3. Create db

`rails db:create`

## 4. Run migration

`rails db:migrate`

## 5. Run app

`rails s`

# API

## REST API TABLE TO USER SERVICE

URL / ENDPOINT    |    VERB    |    DESCRIPTION   
----------------- | ---------- | -------------- 
/auth/login       |    POST    | Generate token
/users            |    POST    | Create user      
/users            |    GET     | Return all users
/users/{username} |    GET     | Return user      
/users/{username} |    PUT     | Update user      
/users/{username} |   DELETE   | Destroy user     

## REST API ITEMS AND TAGS

## <code>GET</code> requests

**Request**
 <summary><code>GET</code> <code><b>/items</b></code> <code>(get list of items)</code></summary>

**Headers** : { "Authorization" : token }

 Example response

```json
[
    {
        "id": 1,
        "name": "T-shirt",
        "price": "100.0",
        "text": "Pink",
        "created_at": "2023-07-05T12:09:06.683Z",
        "updated_at": "2023-07-05T12:09:06.683Z",
        "tags": [],
        "user_id": 2
},
    {
        "id": 2,
        "name": "Dress",
        "price": "100.0",
        "text": "Black",
        "created_at": "2023-07-05T12:11:15.504Z",
        "updated_at": "2023-07-05T12:11:15.504Z",
        "tags": [            {
          "id": 1,
          "name": "tag1",
          "created_at": "2023-07-10T08:58:53.094Z",
          "updated_at": "2023-07-10T08:58:53.094Z"
        }],
        "user_id": 2
    }

]
```

**Request**
 <summary><code>GET</code> <code><b>/items/{:id}</b></code> <code>(get item with id = :id)</code></summary>

**Headers** : { "Authorization" : token }

Example response

```json
{
  "id": 1,
  "name": "T-shirt",
  "price": "100.0",
  "text": "Pink",
  "created_at": "2023-07-05T12:09:06.683Z",
  "updated_at": "2023-07-05T12:09:06.683Z",
  "tags": []
}
```

**Request**
 <summary><code>GET</code> <code><b>/tags</b></code> <code>(get tags)</code></summary>

Example response

```json
[
  {
    "id": 1,
    "name": "tag1",
    "created_at": "2023-07-05T17:10:46.345Z",
    "updated_at": "2023-07-05T17:10:46.345Z"
  },
  {
    "id": 2,
    "name": "tag2",
    "created_at": "2023-07-05T17:11:03.293Z",
    "updated_at": "2023-07-05T17:11:03.293Z"
  }
]
```

## <code>POST</code> requests

**Request**
 <summary><code>POST</code> <code><b>/items</b></code> <code>(Create new item)</code></summary>

**Headers** : { "Authorization" : token }

Parameters 
```json
{
  "name": "T-shirt",
  "price": "100.0",
  "text": "Pink",
  "tags": [{"name": "tag1"}, {"name": "tag2"}]
}
```

**Request**

 <summary><code>POST</code> <code><b>/tags</b></code> <code>(Create new tag)</code></summary>

Parameters
```json
{
  "name": "tag1"
}
```
## <code>PATCH</code> requests

**Request**
 <summary><code>PATCH</code> <code><b>/items/{:id}</b></code> <code>(Update item)</code></summary>

**Headers** : { "Authorization" : token }

Parameters
```json
{
  "price": "110.0",
  "tags": [{"name": "tag3"}]
}
```
## <code>DELETE</code> requests

With Authorization:

 <summary><code>DELETE</code> <code><b>/items/{:id}</b></code> <code>(delete item with id = :id)</code></summary>

 <summary><code>DELETE</code> <code><b>/items/{:id}/tags/{:id}</b></code> <code>(delete tag from item (but not from tags)</code></summary>

Without Authorization

 <summary><code>DELETE</code> <code><b>/tags/{:id}</b></code> <code>(delete tag with id = :id)</code></summary>
