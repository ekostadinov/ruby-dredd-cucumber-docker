# frozen_string_literal: true

require 'json'
require 'dredd_hooks/methods'

include DreddHooks::Methods

# run dredd w/ --names to get transaction_name
before 'Debugging webhooks BODY > / > POST > 200' do |transaction|
  transaction_body = transaction['request']['body']
  transaction_body = '{}' if transaction_body.to_s.empty?

  # parse request body from API description
  request_body = JSON.parse transaction_body

  # modify request body here
  request_body['username'] = 'new_username'
  request_body['password'] = 'new_password'

  # stringify the new body to request
  transaction['request']['body'] = request_body.to_json
end

#           |transactions|
after_all do ||
  # exec 'sudo docker stop mock-api-srv'
end
