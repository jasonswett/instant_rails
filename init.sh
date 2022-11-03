# Use this script by running ./init.sh your_app_name
# More details at https://github.com/jasonswett/instant_rails

APP_NAME=$1
mkdir $APP_NAME
cd $APP_NAME

rails new . \
  -f \
  -T \
  -d postgresql \
  -m ../template/template.rb
  
docker compose up -d
bin/setup
