FROM node:12
COPY paulaapp /paulaapp
WORKDIR /paulaapp
RUN npm install
CMD ["node", "/paulaapp/app.js"]