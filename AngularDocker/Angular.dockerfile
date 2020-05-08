FROM node:6
RUN mkdir -p home/aju/app
WORKDIR home/aju/app
COPY package.json /usr/src/app
RUN npm cache clean
RUN npm install
COPY ./expressjs-server/ ./
EXPOSE 4200
CMD ["npm","start"]