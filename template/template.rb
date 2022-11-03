# frozen_string_literal: true

def source_paths
  [__dir__]
end

code = <<-CODE
default: &default
  adapter: postgresql
  encoding: unicode
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  username: #{@app_name}
  host: 127.0.0.1
  port: 5433

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
file "config/database.yml", code, force: true

template "docker-compose.yml.tt", "docker-compose.yml"
template "init.sql.tt", "init.sql"

run "docker compose up -d"
run "bin/setup"
