FROM node:alpine as builder

WORKDIR ./app

COPY package.json . 
RUN npm install
COPY . .

RUN npm run build

FROM nginx
EXPOSE 80 # This is only for Elasticbeanstalk
COPY --from=builder /app/build /usr/share/nginx/html
