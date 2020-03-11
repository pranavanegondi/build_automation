FROM node:11.1

RUN mkdir -p /usr/src/app

WORKDIR /usr/src/app

COPY package.json /usr/src/app/
COPY .env /usr/src/app/
COPY init.sql /usr/src/app/
COPY wait-for-it.sh /usr/src/app/
COPY . /usr/src/app/

RUN chmod +x /usr/src/app/wait-for-it.sh
RUN chmod +x /usr/src/app/init.sql

RUN yarn install && \
    npm rebuild bcrypt --build-from-source

EXPOSE 4000

CMD [ "npm", "run", "start_dev"]