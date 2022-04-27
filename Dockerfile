FROM node:16.13.0

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install nodejs -y
RUN apt-get install ffmpeg -y

WORKDIR /app
COPY . /app
RUN npm install
RUN npm install -g pm2
CMD ["pm2 start index.js", "pm2 save", "pm2 logs"]
EXPOSE 6892
