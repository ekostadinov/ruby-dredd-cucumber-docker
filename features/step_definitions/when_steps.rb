# frozen_string_literal: true

require 'json'
require 'socket'
require 'logger'

logger = Logger.new($stdout)
logger.level = Logger::DEBUG
logger.datetime_format = '%Y-%m-%d %H:%M:%S'

When(/^I send a JSON message to the socket:$/) do |string|
  @data_sent = string
  @client.send @data_sent, 0
end

When(/^I send a newline character as a message delimiter to the socket$/) do
  @client.send "\n", 0
end

When(/^I run "([^"]*)" command$/) do |command|
  logger.info("Executing command: \n #{command}")
  @output = `#{command}`
end
