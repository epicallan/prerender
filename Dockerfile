FROM node:latest

RUN mkdir /src

# Provides cached layer for node_modules

ADD package.json /tmp/
RUN cd /tmp && npm install --production --silent #redo
RUN cp -a /tmp/node_modules /src/ #redo

# copy app files into
COPY . /src

WORKDIR /src

RUN npm install -g nodemon --silent

ENV PORT 7979

EXPOSE 7979

CMD npm start
