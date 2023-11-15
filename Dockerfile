FROM node:latest AS build

WORKDIR /app

COPY . .

RUN npm install
RUN ng build --configuration=production

FROM nginx:alpine

COPY --from=build /app/dist/co-co-market /usr/share/nginix/html


EXPOSE 4200
CMD ["nginx", "-g", "daemon off;"]