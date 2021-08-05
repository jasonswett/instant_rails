# Use this script by running ./init.sh your_app_name
# More details at https://www.codewithjason.com/instant-rails/

function fill_template {
  sed -ie "s/\${app_name}/$APP_NAME/" $1
}

APP_NAME=$1
mkdir $APP_NAME
cd $APP_NAME

cp ../Dockerfile .

cp ../docker-compose.yml .
fill_template docker-compose.yml

cp ../init.sql .
fill_template init.sql

cp -R ../template template

docker compose run -e INSTANT_RAILS_APP_NAME=$1 web \
  rails new . \
  -f \
  -T \
  -d postgresql \
  -m template/template.rb

docker compose run web bin/initialize
docker compose up
