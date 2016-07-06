# http_distributor

http server which allows sneaky http request though it.

## Installation [![travis](https://travis-ci.org/Nephos/http_distributor.svg)](https://travis-ci.org/Nephos/http_distributor)

Be sure you have ``crystal > 0.18``

```sh
crystal deps
crystal compile ./src/http_distributor --release
```

## Deploy on heroku

according to [crystal-lang.org](https://crystal-lang.org/2016/05/26/heroku-buildpack.html)

```sh
cd http_distributor/
heroku create --buildpack https://github.com/crystal-lang/heroku-buildpack-crystal.git
git push heroku master
```

## Usage

### Start
```sh
./http_distributor [--port=PORT]
```

### Configuration

#### Environment variables

- ``change_agent_probability``
- ``wait_fixed``
- ``wait_random_min`` and ``wait_random_max``
- ``wait_delay_coefficient``

### Routes
- ``/get/url_base64_encoded``
- ``/get/config``
- ``/get/domains``
- ``/get/ping``

### Important
You need an authentication token to do any request.
This token may be specified in an environment variable ``AUTH_TOKEN``.
If the token is not specified, it is automatically created when the server
starts, randomly, and wrote on the stderr.

The auth token must be specified in query parameter.
Example: ``/get/xxx?auth_token=xxx``

## Development

TODO: Write development instructions here

## Contributing

1. Fork it ( https://github.com/Nephos/http_distributor/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [Nephos](https://github.com/Nephos) Arthur Poulet - creator, maintainer
