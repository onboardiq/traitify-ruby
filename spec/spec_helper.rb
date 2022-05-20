require "traitify"
require "webmock/rspec"
require "pry"

Dir[File.expand_path("spec/support/**/*.rb", __FILE__)].each{|f| require f}

RSpec.configure do |config|
  config.color = true
  config.order = "random"
end

def stub_it(http_method = :any, endpoint = "/", status = 200, response)
  url = "https://example.com/v1#{endpoint}"
  stub_request(http_method, url).to_return(
    status: status,
    body: File.read(File.expand_path("../support/mocks/#{response}.json", __FILE__)),
    headers: {
      'Accept'=>'application/json',
      'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
      'Authorization'=>'Basic c2VjcmV0Ong=',
      'Content-type' => "application/json",
      'User-Agent'=>'Faraday v1.10.0'
    }
  )
end
