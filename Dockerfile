
FROM node:latest as node
WORKDIR /srv

COPY . . 
RUN npm install
RUN npm run build --prod

FROM  nginx:alpine
COPY --from=node /srv/build    /usr/share/nginx/html 


