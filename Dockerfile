# NOTE: this example is taken from the default Dockerfile for the official nginx Docker Hub Repo
# https://hub.docker.com/_/nginx/
# NOTE: This file is slightly different than the video, because nginx versions have been updated 
#       to match the latest standards from docker hub... but it's doing the same thing as the video
#       describes
FROM node:12
# all images must have a FROM
# usually from a minimal Linux distribution like debian or (even better) alpine
# if you truly want to start with an empty container, use FROM scratch


# optional environment variable that's used in later lines and set as envvar when container is running
# Create app directory
WORKDIR home/aju/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package.json ./

RUN npm install
# If you are building your code for production
# RUN npm ci --only=production
# optional commands to run at shell inside container at build time

# Bundle app source

COPY expressjs-server/ ./

# forward request and error logs to docker log collector

EXPOSE 3000
# expose these ports on the docker virtual network
# you still need to use -p or -P to open/forward these ports on host

CMD [ "npm", "start" ]
# required: run this command when container is launched
# only one CMD allowed, so if there are multiple, last one wins
