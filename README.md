# ddr-aux

Auxiliary web services for the Duke Digital Repository

## Usage

Basic Example 

```ruby
require 'json'
require 'net/http'

uri = URI("<base_url>/api/method")
response = Net::HTTP.get_response(uri)
JSON.load(response.body)
```

## ActiveResource

If you have the `activeresource` gem installed:

```ruby
require 'active_resource'

class RightsStatement < ActiveResource::Base
  self.site = "http://localhost:3000/api"
end
```

Now you can use the usual methods:

```ruby
RightsStatement.all

RightsStatement.where(url: "http://example.com")

RightsStatement.find(1)
```
