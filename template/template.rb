# frozen_string_literal: true

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

template "config/database.yml.tt", "config/database.yml", force: true

[
  "bin/setup",

  # Static pages
  "app/controllers/static_pages_controller.rb",
  "app/views/static_pages/home.html.erb",

  "config/initializers/rack_mini_profiler.rb",

].each do |file_path|
  copy_file file_path, file_path, force: true
end

route "root to: 'static_pages#home'"
directory "post_templates", "post_templates"

# Skip bundle install
def run_bundle; end

# Skip yarn install
def run_webpack; end
