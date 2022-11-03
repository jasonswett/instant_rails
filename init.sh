# Use this script by running ./init.sh your_app_name
# More details at https://github.com/jasonswett/instant_rails

rails new $1 \
  -T \
  -d postgresql \
  -m template/template.rb
