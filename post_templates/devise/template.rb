# frozen_string_literal: true

generate "devise:install"
environment "config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }", env: "development"
generate :devise, "User"
