
FROM node:lts-buster

RUN apt-get update && \
  apt-get install -y \
  ffmpeg \
  imagemagick \
  webp && \
  apt-get upgrade -y && \
  rm -rf /var/lib/apt/lists/*

COPY package.json .

RUN  git clone https://github.com/patronffx/patron-testing  /root/Flash_BOt
WORKDIR /root/Flash_Bot/

COPY . .

EXPOSE 3000

CMD ["node", "index.js", "--server"]
