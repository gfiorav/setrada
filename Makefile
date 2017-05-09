.PHONY: test

test:
	RAILS_ENV=test bundle exec rails test

setup:
	bundle exec rails db:create
	bundle exec rails db:migrate

test-setup:
	make test-crazynuke
	RAILS_ENV=test bundle exec rails db:create
	RAILS_ENV=test bundle exec rails db:migrate

test-crazynuke:
	RAILS_ENV=test bundle exec rails db:drop

crazynuke:
	bundle exec rails db:drop
	make setup
