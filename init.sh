APP_DIR=$1
mkdir $APP_DIR
cd my_app

cp ../Dockerfile .
cp ../docker-compose.yml .

docker compose run web rails new . -f -d postgresql 
