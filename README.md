# rclone-azcli

Simple docker container that includes rclone and az cli and can be used to copy files to an azure storage account. This project requires an existing storage account and contributior access to the storage account to add a firewall rule if the storage account is protected by the storage account firewall. This solution completes the following tasks:

1. Az CLI Login using service principal credentials
2. Sets the subscription based on the provided value
3. Configures an Azure storage account backend
4. Copies everything in the /files directory to the backend

## Requirements

You will need the following items for this to be successful.

1. ACCOUNT # storage account name
2. RESOURCE_GROUP # resource group where the storage account is located
3. KEY # storage account access key
4. APP_ID # Service Principal Application ID from AAD
5. APP_SECRET # Secret for the service principal
6. TENANT_ID # The tenant ID where the storage account is located
7. SUBSCRIPTION_ID # The subscription id where the storage account is located
8. CONTAINER # The name of the container you would like to copy files to
9. DIRECTION # (UPLOAD-SERVICE/UPLOAD-DATADB/DOWNLOAD-SERVICE/DOWNLOAD-DATADB) direction in which you want to copy

*DIRECTION* is used to upload or download the files. If you choose upload, it will copy everything from the local machine and copy it to the azure storage account configured. If you choose download, it will download everything to the files directory, which should be mapped to a docker volume.

**This information can be passed into the docker container using an environment file.**

This container requires a volume to be mapped to the files directory in the container. Everything, including directories, mapped to this directory inside the container will be copied to the storage account. Use the docker volume syntax to attach the volume accordingly.

This information can be passed into the docker container using an environment file.

Windows:
```bash
docker run --it -v C:/some/file/path:/files--env-file docker.env tpeterson66/rclone-azcli "bash copy.sh"
```

Linux:
single volume
```bash
docker run --it -v /some/file/path/filestore/:/filestore/ --env-file docker.env tpeterson66/rclone-azcli bash copy.sh
```
multiple volumes
```bash
docker run --it -v /some/file/path/es/:/es/ -v /some/file/path/redis/:/redis/ --env-file docker.env tpeterson66/rclone-azcli bash copy.sh
```
