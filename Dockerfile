FROM node:lts-bullseye
WORKDIR /app
COPY . .
RUN npm install
#RUN npm test
RUN npm run build
EXPOSE 3000
CMD ["npm","run", "start"]
