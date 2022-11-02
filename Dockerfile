FROM ubuntu:kinetic-20220830
RUN apt-get update && apt-get install -y \
    rclone \
    curl 
RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash
COPY ./copy.sh .
RUN chmod +x copy.sh