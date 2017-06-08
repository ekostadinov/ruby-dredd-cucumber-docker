[![Build Status](https://travis-ci.org/ekostadinov/ruby-dredd-cucumber-docker.svg?branch=master)](https://travis-ci.org/ekostadinov/ruby-dredd-cucumber-docker)

## HTTP API Beckend tests

This framework is based on [Dredd](https://github.com/apiaryio/dredd) framework via Ruby [hooks](https://dredd.readthedocs.io/en/latest/hooks-ruby/). How-To [guides](https://dredd.readthedocs.io/en/latest/how-to-guides/) and [BDD boilerplate](https://github.com/apiaryio/dredd-hooks-template).

#### TODO
- Add Docker loging service container via [AWS free tier](http://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/billing-free-tier.html)
- Enable Rake cucumber tasks
- Add IaC support

#### Project setup
First time on local environment:
- setup ruby
- run `bundle install`
- setup nodejs
- run `npm install -g dredd`
- setup docker
- add to your `.bashrc` the following lines
    - source /usr/local/share/chruby/chruby.sh
    - source /usr/local/share/chruby/auto.sh

Every next time:
- `npm install -y`
- `bundle install`
- run via dredd `bundle exec dredd localhost:8000 --language ruby --hookfiles ./hooks/*.rb`
- run via cucumber `bundle exec cucumber features/endpoint_json_logger.feature --guess`

Mock test environment:
- run `docker run --name mock-api-srv --rm -p "8000:8000" rodrigodiez/endpoint-json-logger` (web server [container](https://hub.docker.com/r/rodrigodiez/endpoint-json-logger/) for debugging webhooks)
- simple test `curl -X POST -d '[{"username":"xyz","password":"xyz"}]'  localhost:8000`
