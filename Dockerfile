# pull official base image
FROM node:16-alpine

# set working directory
WORKDIR /app

# add node "binaries" to $PATH
ENV PATH /app/node_modules/.bin:$PATH

# install app dependencies
COPY package.json ./
COPY package-lock.json ./
RUN npm install --silent
RUN npm install react-scripts -g --silent

# add app
COPY . ./

# start!
CMD ["npm", "start"]