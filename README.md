This readme is an explanation of Group2's phase 4 submission.

The main directory containes the service fiel that is used to automatically start the docker containter named "dry-run2", which is the container that we created from the image named "image" which was built from the dockerfile.

The dockerfile folder contains the docker file, configuration files from the sql vm, and the sql.dump file of the sql database from the sqlvm

The webpages folder container the table.cgi file, which is the apache webpage that was created. It has been modified to run off of the docker container.

To create a new container, you must first disable the service file, then stop the docker container, create a new docker container, the nmodify the service file to start your new container.

Relevant commands/steps:
sudo systemctl stop docker-container.service

sudo docker stop dry-run2

sudo docker run --name "container_name" -d -p 5432:5432 image

(Replace "container_name" with a name of your choice)

sudo docker start "container_name" to test it's functionality.

Navigate to the /etc/systemd/system directory

sudo nano docker-container.service

Modify the ExecStart and ExecStop lines to suit your containers name. ctrl + s to save

sudo systemctl daemon-reload

sudo systemctl restart docker-container.service

Now following a vm restart the new container will start automatically.
