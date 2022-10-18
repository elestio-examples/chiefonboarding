set env vars
set -o allexport; source .env; set +o allexport;

# apt install -y cerbot

mkdir -p ./data
chown -R 1000:1000 ./data
