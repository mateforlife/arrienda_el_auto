web: bundle exec puma -C config/puma.rb
worker: bundle exec sidekiq -t 25 -q default -q mailers -q easy_car_production_active_storage_analysis -C config/sidekiq.yml
release: rails db:migrate