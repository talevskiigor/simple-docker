#!/bin/bash
if [ -f .env ]; then
    cmp --silent .env .env.example && echo -e '\nFiles Are Identical! ###' && echo -e "Please update .env with your data" && exit 0
    export $(echo $(cat .env | sed 's/#.*//g'| xargs) | envsubst)
fi

docker-compose --project-name "${PREFIX}" build ${PREFIX}ubuntu