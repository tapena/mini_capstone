require 'http'

HTTP.get("http://localhost:3000/api/products")

p response.parse