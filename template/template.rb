# frozen_string_literal: true

def source_paths
  [__dir__]
end

def instant_rails_file(filename, content)
  file filename, content, force: true
end

instant_rails_file "config/initializers/generators.rb", <<-CODE
Rails.application.config.generators do |g|
  g.orm :active_record, primary_key_type: :uuid
  g.stylesheets false
  g.helper false
  g.serializer false
  g.jbuilder false

  g.test_framework :rspec,
                   fixtures: false,
                   view_specs: false,
                   helper_specs: false,
                   routing_specs: false,
                   request_specs: false,
                   controller_specs: false
end
CODE

append_to_file '.gitignore', <<-CODE
.env
CODE

instant_rails_file ".env", <<-CODE
DATABASE_HOST=127.0.0.1
CODE

gem "paranoia"

gem "audited"
after_bundle { rails_command("generate audited:install") }
after_bundle { rails_command("db:migrate") }

gem "devise"
after_bundle { rails_command("generate devise:install") }
after_bundle { rails_command("generate devise users") }
after_bundle { rails_command("db:migrate") }

gem_group :development, :test do
  gem "dotenv-rails"
  gem "capybara"
  gem "factory_bot_rails"
  gem "faker"
  gem "rspec-rails"
end
after_bundle { rails_command("generate rspec:install") }

instant_rails_file "config/database.yml", <<-CODE
default: &default
  adapter: postgresql
  encoding: unicode
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  username: #{@app_name}
  host: 127.0.0.1
  port: 5434

development:
  <<: *default
  database: #{@app_name}_development

test:
  <<: *default
  database: #{@app_name}_test

production:
  <<: *default
  database: #{@app_name}_production
  username: #{@app_name}
  password:
CODE

instant_rails_file "docker-compose.yml", <<-CODE
---
version: "3.8"

services:
  postgres:
    image: postgres:13.1-alpine
    volumes:
      - postgresql:/var/lib/postgresql/data:delegated
      - ./init.sql:/data/application/init.sql
    ports:
      - "127.0.0.1:5434:5432"
    environment:
      PSQL_HISTFILE: /usr/src/app/log/.psql_history
      POSTGRES_USER: #{@app_name}
      POSTGRES_HOST_AUTH_METHOD: trust
    restart: on-failure
    healthcheck:
      test: ["CMD-SHELL", "pg_isready -U #{@app_name}"]
      interval: 10s
      timeout: 2s
      retries: 10
    logging:
      driver: none

  redis:
    image: redis:4.0.14-alpine
    volumes:
      - redis:/data:delegated
    ports:
      - "127.0.0.1:6381:6379"
    restart: on-failure
    logging:
      driver: none

volumes:
  postgresql:
  redis:
CODE

file "init.sql", "CREATE USER #{@app_name};"

run "docker compose up -d"
run "bin/setup"
