web: bundle exec puma -C config/puma.rb
worker: bundle exec sidekiq -t 25 -q default -q mailers
release: rails db:migrate