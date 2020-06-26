# Yodel
#### is a compound of youtube-dl that wrapped in docker-container and bash script to run a container and pass arguments

Docker image
```
    docker pull turneps403/youtube-dl
```

Install **yodel.sh**
```
    $ sudo cp yodel.sh /usr/local/bin/yodel
    $ sudo chmod +x /usr/local/bin/yodel
```

Example of usage
```
    yodel -v=https://www.youtube.com/watch?v=S2nBBMbjS8w -d=.
    yodel -v=https://www.youtube.com/watch?v=S2nBBMbjS8w -d=/tmp/youtube
    yodel -v=https://www.youtube.com/watch?v=S2nBBMbjS8w -d=~/Download
    yodel -v=https://www.youtube.com/playlist?list=PLCIVZWq1FAwdgPlZJDOwh2tvWE0aDB1Uo
```
