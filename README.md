# Good Night

## How to run

Make sure you have latest docker installed. Then call compose up.

```shell
$ sudo docker compose up
```

## Resources

The provided APIs are JSON:API compliant. Please refer to the [JSON:API spec](https://jsonapi.org/format/1.0/) for more info.

### User resources

User resources can be accesses under `/users` path.

```shell
$ curl -i -H "Accept: application/vnd.api+json" -H 'Content-Type:application/vnd.api+json' -X POST -d '{"data": {"type": "users", "attributes": {"name": "Example User"}}}' http://localhost:3000/users
```

Supported operations are `GET` and `POST`.

### User resource

User resource can be accesses under `/users/:id` path.

```shell
$ curl -i -H "Accept: application/vnd.api+json" -X GET http://localhost:3000/users/1
```

Supported operations are `GET`, `PUT`, `PATCH`, and `DELETE`.

#### User's relationships

Two linked resources that provided with user resource are `sleeps` and `followees`. Individual linked resource can be accessed via `/users/:id/sleeps` and `/users/:id/relationships/sleeps` for `sleeps` resource, and `/users/:id/followees` and `/users/:id/relationships/followees` for `followees` resource.

### Sleep resources

Sleep resources can be accesses under `/sleeps` path.

```shell
$ curl -i -H "Accept: application/vnd.api+json" -H 'Content-Type:application/vnd.api+json' -X POST -d '{"data": {"type": "sleeps", "attributes": {"user-id": "1", "start-time": "20230101T000000Z"}}}' http://localhost:3000/sleeps
```

Supported operations is `POST`.

### Sleep resource

Sleep resource can be accesses under `/sleeps/:id` path.

```shell
$ curl -i -H "Accept: application/vnd.api+json" -X GET http://localhost:3000/sleeps/1
```

Supported operations are `GET`, `PUT`, `PATCH`, and `DELETE`.

### Extra

To clock in, create the sleep record and provide the user-id. User id can be accessed via `/users`.

```shell
$ curl -i -H "Accept: application/vnd.api+json" -X GET http://localhost:3000/users
$ curl -i -H "Accept: application/vnd.api+json" -H 'Content-Type:application/vnd.api+json' -X POST -d '{"data": {"type": "sleeps", "attributes": {"user-id": "1", "start-time": "20230101T000000Z"}}}' http://localhost:3000/sleeps
$ curl -i -H "Accept: application/vnd.api+json" -H 'Content-Type:application/vnd.api+json' -X PATCH -d '{"data": {"id": "1", "type": "sleeps", "attributes": {"end-time": "20230101T070000Z"}}}' http://localhost:3000/sleeps/1
```

To return all of the user's sleep records, get the records via related link, `/users/:id/sleeps`. It ordered by created time in descending order by default.

```shell
$ curl -i -H "Accept: application/vnd.api+json" -X GET http://localhost:3000/users/1/sleeps
```

To follow a user, create the follow relationships via relationships link, `/users/:id/relationships/followees`.

```shell
$ curl -i -H "Accept: application/vnd.api+json" -H 'Content-Type:application/vnd.api+json' -X POST -d '{"data": [{"type": "followees", "id": "2"}]}' http://localhost:3000/users/1/relationships/followees
```

To unfollow, delete the relationships.

```shell
$ curl -i -H "Accept: application/vnd.api+json" -H 'Content-Type:application/vnd.api+json' -X DELETE -d '{"data": [{"type": "followees", "id": "2"}]}' http://localhost:3000/users/1/relationships/followees
```

To see followees' sleep records, you can use path, `/users/:id/followees-sleeps`.
To filter only the past week, pass `filter[created_since]=last_week` filter. To sort by the sleep duration, pass `sort=duration`. To inverse to order, pass minus sign, `sort=-duration`.

```shell
$ curl -i -H "Accept: application/vnd.api+json" -X GET http://localhost:3000/users/1/followees-sleeps?filter[created_since]=last_week&sort=-duration
```
