#!/bin/sh

npm i
npm run build
docker compose up -d --build