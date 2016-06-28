# crystal_proxy

TODO: Write a description here

## Installation


TODO: Write installation instructions here


## Usage

### Start

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
