FROM node:14
WORKDIR /app
COPY src/ ./
COPY public/ ./
COPY package*.json ./
RUN npm install --prefix package.json --no-audit
RUN npm lint --prefix package.json --no-audit
RUN npm prettier --prefix package.json --no-audit
RUN npm test --prefix package.json --no-audit
RUN npm build --prefix package.json --no-audit
EXPOSE 3000
COPY . ./
CMD npm install;npm audit fix;npm run;npm start