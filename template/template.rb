# frozen_string_literal: true

def source_paths
  [__dir__]
end

template "config/database.yml.tt", "config/database.yml", force: true
