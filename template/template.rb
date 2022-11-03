# frozen_string_literal: true

def source_paths
  [__dir__]
end

template "config/database.yml.tt", "config/database.yml", force: true
template "docker-compose.yml.tt", "docker-compose.yml"
template "init.sql.tt", "init.sql"

run "docker compose up -d"
run "bin/setup"
