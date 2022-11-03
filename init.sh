# Use this script by running ./init.sh your_app_name
# More details at https://www.codewithjason.com/instant-rails/

fill_template () {
  sed -ie "s/\${app_name}/$APP_NAME/" $1
}

APP_NAME=$1
mkdir $APP_NAME
cd $APP_NAME

cp ../docker-compose.yml .
fill_template docker-compose.yml

cp ../init.sql .
fill_template init.sql

rails new . \
  -f \
  -T \
  -d postgresql \
  -m ../template/template.rb
  
docker compose up -d
bin/setup
