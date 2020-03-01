# BUILD
FROM node:alpine as builder
WORKDIR /app
COPY package.json .
COPY package-lock.json .
RUN npm install
COPY . .
RUN npm run build

# /app/build <--- all we care about at this point

# SERVE
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html