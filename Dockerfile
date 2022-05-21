FROM node:10.13.0 as build

WORKDIR /app

COPY ./package*.json ./
RUN npm install

COPY gatsby-*.js ./
COPY static ./static
#COPY public ./public

COPY . .
RUN ["npm" ,"run" ,"build"]


FROM node:10.13.0-alpine

RUN npm i -g serve

WORKDIR /app
EXPOSE 5000

COPY --from=build /app/public ./

ENTRYPOINT ["serve"]
