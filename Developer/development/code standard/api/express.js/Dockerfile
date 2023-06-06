FROM public.ecr.aws/docker/library/node:16.18-alpine3.15

# Create app directory
WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install
RUN npm install -g forever
COPY . .

EXPOSE 3000
CMD [ "npm", "start" ]