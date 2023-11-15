FROM node:latest as build

WORKDIR /app

COPY . .

RUN npm install
RUN npm run build --prod

From nginx:alpine

COPY --from=build /app/dist/co-co-market /usr/share/nginix/html


EXPOSE 4200
CMD ["ngix", "-g","daemon off;"]
