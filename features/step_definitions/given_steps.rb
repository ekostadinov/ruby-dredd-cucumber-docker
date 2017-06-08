# frozen_string_literal: true

require 'json'
require 'socket'
require 'logger'

logger = Logger.new($stdout)
logger.level = Logger::DEBUG
logger.datetime_format = '%Y-%m-%d %H:%M:%S'

Given(/^I have "([^"]*)" command installed$/) do |command|
  is_present = system("which #{command} > /dev/null 2>&1")
  raise "Command #{command} is not present in the system" unless is_present
end

Given(/^server under test is running$/) do
  logger.info('Docker container should be running!')
end

Given(/^I connect to the server$/) do
  # @client = TCPSocket.new 'localhost', 61321
end
