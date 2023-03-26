JSONAPI.configure do |config|
  #:integer, :uuid, :string, or custom (provide a proc)
  config.resource_key_type = :uuid
end
