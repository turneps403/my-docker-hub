FROM python:3-alpine
LABEL version="1.0"
LABEL description="simple stady purposes"

# https://www.ostechnix.com/youtube-dl-tutorial-with-examples-for-beginners/

WORKDIR /usr/local/bin
RUN wget https://yt-dl.org/downloads/latest/youtube-dl -O /usr/local/bin/youtube-dl
RUN chmod a+rx /usr/local/bin/youtube-dl
RUN youtube-dl -U

ENTRYPOINT ["youtube-dl", "-f", "best", "-o", "/tmp/download/%(title)s-%(id)s.%(ext)s"]
