FROM ubuntu:latest
RUN apt-get update && apt-get install -y \
    rclone \
    curl 
RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash
COPY ./copy.sh /scripts/
RUN chmod +x copy.sh