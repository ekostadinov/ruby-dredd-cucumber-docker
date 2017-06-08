# frozen_string_literal: true

require 'json'
require 'socket'
require 'test/unit/assertions'
require 'logger'

include Test::Unit::Assertions

logger = Logger.new($stdout)
logger.level = Logger::DEBUG
logger.datetime_format = '%Y-%m-%d %H:%M:%S'

Then(/^It should start listening on localhost port "([^"]*)"$/) do |port|
  @client = TCPSocket.new 'localhost', port
  @client.close
end

Then(/^I should receive same response$/) do
  sleep 1
  data_received = @client.readline
  if JSON.parse(data_received) != JSON.parse(@data_sent)
    @client.close!
    raise "Data received:\n#{data_received}\nDoesn't match data sent: #{@data_sent}\n"
  end
end

Then(/^I should be able to gracefully disconnect$/) do
  @client.close
end

Then(/^the command output should contain:$/) do |expected|
  logger.info("Captured output from command: \n #{@output}")

  assert(
    @output[expected],
    "\n\t\t Command output does not contain: \n\t\t #{expected} \n"
  )
end

Then(/^the dredd tests should pass$/) do
  logger.info("Captured output from command: \n #{@output}")

  assert(
    @output['0 failing, 0 errors,'],
    '\n\t\t Command did not succeeded! \n'
  )
end
