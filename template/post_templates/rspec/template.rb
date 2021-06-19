# frozen_string_literal: true

def source_paths
  [__dir__]
end

generate "rspec:install"

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

uncomment_lines 'spec/rails_helper.rb', /spec.+support.+require/

[
  ".rspec",
  "spec/support/chrome.rb",
  "spec/system/sign_in_spec.rb",
  "spec/factories/users.rb",
].each do |file_path|
  copy_file file_path, file_path, force: true
end
