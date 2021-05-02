# frozen_string_literal: true

def source_paths
  [__dir__]
end

application_scss_filename = "app/javascript/stylesheets/application.scss"
copy_file application_scss_filename, application_scss_filename, force: true

tailwind_config_filename = "app/javascript/stylesheets/tailwind.config.js"
copy_file tailwind_config_filename, tailwind_config_filename, force: true

inject_into_file "app/views/layouts/application.html.erb", before: /.+javascript_pack_tag/ do
  "    <%= stylesheet_pack_tag 'application', 'data-turbolinks-track': 'reload' %>\n"
end

inject_into_file "app/javascript/packs/application.js", before: /Rails.start()/ do
  "import \"stylesheets/application.scss\"\n\n"
end

inject_into_file "postcss.config.js", after: /require\('postcss-import'\),/ do
  %(\n    require('tailwindcss')('app/javascript/stylesheets/tailwind.config.js'),
    require('autoprefixer'),\n)
end
