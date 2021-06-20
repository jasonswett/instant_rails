APP_DIR=$1
mkdir $APP_DIR
cd my_app

cp ../Dockerfile .
cp ../docker-compose.yml .
cp -R ../template template

docker compose run web rails new . -f -T -d postgresql -m template/template.rb
#sudo chown -R $USER .
