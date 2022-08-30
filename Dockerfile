FROM alpine:latest

WORKDIR /usr/app

RUN apk --no-cache add curl wget

ENV PORT=3000 AUTH_USER=admin AUTH_PASSWORD=admin@123

COPY . .

CMD sh ./bootloader.sh

EXPOSE ${PORT}
