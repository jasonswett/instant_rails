def source_paths
  [__dir__]
end

gem_group :development, :test do
  gem 'rspec-rails'
  gem 'factory_bot_rails'
  gem 'capybara'
  gem 'webdrivers'
  gem 'faker'
end

initializer 'generators.rb', <<-CODE
  Rails.application.config.generators do |g|
    g.test_framework :rspec,
      fixtures:         false,
      view_specs:       false,
      helper_specs:     false,
      routing_specs:    false,
      request_specs:    false,
      controller_specs: false
  end
CODE

gem "devise"

inject_into_file "app/views/layouts/application.html.erb", after: /<body>/ do
  <<-HTML

    <% if user_signed_in? %>
      <div class="text-right">
        <%= link_to 'Sign Out', destroy_user_session_path, method: :delete, class: 'text-right' %>
      </div>
    <% else %>
      <div class="text-right">
        <%= link_to 'Sign In', new_user_session_path %>
      </div>
    <% end %>
  HTML
end

[
  "docker-compose.yml",
  "config/database.yml",

  # Static pages
  "app/controllers/static_pages_controller.rb",
  "app/views/static_pages/home.html.erb",

].each do |file_path|
  copy_file file_path, file_path, force: true
end

route "root to: 'static_pages#home'"

after_bundle do
  run 'bin/spring stop'
  generate 'rspec:install'

  generate "devise:install"
  environment "config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }", env: "development"
  generate :devise, "User"
end
