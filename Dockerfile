FROM node:10.13.0-alpine as build

WORKDIR /app


RUN apk update && apk add libglu1

COPY ./package*.json ./
RUN npm install

COPY gatsby-*.js ./
COPY static ./static
#COPY public ./public

COPY . .
RUN ["npm" ,"run" ,"build"]


FROM node:12.13.0-alpine

RUN npm i -g serve

WORKDIR /app
EXPOSE 3000

COPY --from=build /app/public ./

ENTRYPOINT ["serve"]
