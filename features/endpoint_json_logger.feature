Feature: Endpoint json logger
  As a QA, I want to call docker container so that my requests are logged.

  Background: Docker is running
    Given server under test is running

  @ignore
  Scenario: Loging service responds to valid JSON
    When I run "dredd ./swagger/endpoint-json-logger-2.yml --language=dredd-hooks-ruby --hookfiles=./hooks/hooks.rb" command
    Then the command output should contain:
      """
      Request decoded: map[username:new_username password:new_password]
      """

  @gitlabci
  Scenario: QA Srv host Loging service responds to valid JSON
    When I run " ./node_modules/dredd/bin/dredd ../../../../swagger/endpoint-json-logger-2.yml --language=dredd-hooks-ruby --hookfiles=./hooks/hooks.rb" command
    Then the dredd tests should pass
