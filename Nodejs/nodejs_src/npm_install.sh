# first install the nodejs and the npm package manager
# npm init to establish files like package.json
# add your source code - index.js

apt install -y nodejs
apt install -y npm
npm install --save express mysql2 node-cron
npm init

# after that you need to build the docker image and push it

