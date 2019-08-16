FROM amsross/egghead:latest

WORKDIR /code

COPY package.json ./
COPY package-lock.json ./
RUN npm ci

COPY ./bsconfig.json ./bsconfig.json
COPY ./src ./src
