# crystal_proxy

TODO: Write a description here

## Installation

Be sure you have ``crystal > 0.18``

```sh
crystal deps
crystal compile ./src/crystal_proxy --release
```

## Deploy on heroku

according to [crystal-lang.org](https://crystal-lang.org/2016/05/26/heroku-buildpack.html)

```sh
cd crystal_proxy
heroku create --buildpack https://github.com/crystal-lang/heroku-buildpack-crystal.git
git push heroku master
```

## Usage

### Start
```sh
./crystal_proxy [--port=PORT]
```


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

1. Fork it ( https://github.com/Nephos/crystal_proxy/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [Nephos](https://github.com/Nephos) Arthur Poulet - creator, maintainer
