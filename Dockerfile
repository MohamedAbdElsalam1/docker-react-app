# First Stage =>>> Build app

FROM node:lts-alpine3.18

WORKDIR /app

COPY . .

RUN npm install

RUN npm run build

# Secound Stage =>>> Serve Static 

FROM nginx

COPY --from=0 /app/dist /usr/share/nginx/html