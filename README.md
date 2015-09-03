# ddr-aux

Auxiliary web services for the Duke Digital Repository

## Usage

All requests via `GET`

All responses have content type `application/json`.

Example

```ruby
require 'json'
require 'net/http'

uri = URI("<base_url>/api/method")
response = Net::HTTP.get_response(uri)
JSON.load(response.body)
```

