#Grab the latest alpine image
FROM alpine:3.4

RUN apk add --update \
    python \
    python-dev \
    py-pip \
    curl ca-certificates \
    libxml2-dev libxslt-dev py-lxml \
  && rm -rf /var/cache/apk/*

ADD . /app
WORKDIR /app

RUN pip install -r requirements.txt

# Expose is NOT supported by Heroku
EXPOSE 5000

# Run the image as a non-root user
RUN adduser -D myuser
USER myuser

# Run the app. CMD is required to run on Heroku
# $PORT is set by Heroku
CMD gunicorn --bind 0.0.0.0:$PORT wsgi

# docker run --rm -ti -p 5000:5000 -e PORT=5000 darwinrest