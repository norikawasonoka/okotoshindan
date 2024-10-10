# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

# This is the main application class for Myapp.
# Myapp::Applicationは、Railsアプリケーションの設定を管理します。

module Myapp
  class Application < Rails::Application
    # アプリケーションの設定はここに記述します。
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.1

    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.
    config.autoload_lib(ignore: %w[assets tasks])

    # Configuration for the application, engines, and railties goes here.
    # アプリケーション、エンジン、レイルティの設定はここに記述します。

    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    # これらの設定は、config/environments にあるファイルを使って特定の環境で上書きされます。

    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
