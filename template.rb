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
  "bin/setup",
  "docker-compose.yml",
  "config/database.yml",

  # Static pages
  "app/controllers/static_pages_controller.rb",
  "app/views/static_pages/home.html.erb",

].each do |file_path|
  copy_file file_path, file_path, force: true
end

route "root to: 'static_pages#home'"
directory "post_templates", "post_templates"

after_bundle do
  run 'bin/spring stop'
  generate "devise:install"
  environment "config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }", env: "development"
  generate :devise, "User"
end
