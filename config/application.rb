require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ArriendaElAuto
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0
    config.eager_load_paths << Rails.root.join('lib')
    # config.middleware.use Rack::Cors do
    #   allow do
    #     origins [
    #       ENV['CLOUDFRONT_DNS'],
    #       'https://arriendaelauto.herokuapp.com',
    #       'http://arriendaelauto.herokuapp.com'
    #     ]
    #     resource '/assets/*', headers: :any,
    #                           methods: %i[get post delete put options head]
    #   end
    # end

    # Use Vips for processing variants.
    config.active_storage.variant_processor = :vips
    config.active_record.default_timezone = :local
    config.index_nested_attributes_errors = true
    config.time_zone = 'America/Santiago'
    config.i18n.default_locale = :es
    config.active_job.queue_adapter = :sidekiq
    # config.middleware.insert_before 0, Rack::Cors do
    #   allow do
    #     origins '*'
    #     resource '*', headers: :any, methods: %i[get post options delete put]
    #   end
    # end
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
