FROM node:22.18 AS etapa_uno

WORKDIR /usr/app

COPY ./ ./

RUN npm install

RUN npm run build

FROM node:22.18-alpine AS etapa_dos

WORKDIR /usr/app

COPY --from=etapa_uno /usr/app/dist ./dist
COPY --from=etapa_uno /usr/app/package*.json ./

RUN npm install --only=production

EXPOSE 4000

CMD ["node","dist/main.js"]