#!/bin/bash
:: Set the project to work on
gcloud config set project my-project-cisc5550

:: Create the virtual machine instance
gcloud compute instances create instance-2 ^
    --machine-type=e2-medium ^
    --image-family=ubuntu-2004-lts ^
    --image-project=ubuntu-os-cloud ^
    --tags=http-server ^
    --zone=us-central1-a

:: Connect to the VM and execute commands
gcloud compute ssh instance-2 --zone=us-central1-a ^
   --command="sudo apt update && sudo apt install -y python3-pip && sudo pip3 install flask && sudo -H pip3 install flask && git clone https://github.com/rosamsierrap/cisc5550.git && sed -i 's|app.run(\"0.0.0.0\")|app.run(\"0.0.0.0\", port=80)|' cisc5550/todolist.py && sudo python3 ~/cisc5550/todolist.py &"
