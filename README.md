# README.md

**Install docker (https://www.docker.com/)**
```batch
run.bat
```
For Linux users install docker from this guide (https://docs.docker.com/engine/install/ubuntu/).
Docker Compose from this Guide (https://docs.docker.com/compose/install/linux/).

```bash
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg
```

```bash
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg
```

```bash
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```

```bash
sudo apt-get update
```

```bash
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

**change the API Keys in the .env file in the database folder before starting the program**

```bash
chmod +x linuxPermission.sh
sudo sh ./run.sh
```
**Pgadmin usage**
After starting the containers localhost:5050 will be available. Simply open the browser of your choice and enter localhost:5050.  
The login credentials for pgadmin are defined in the .env file.  
To enter the database "postgres" is the password for the database and it can be changed in the .env file aswell.  
If you want to restart the containers after they were build and are not running at the moment, use restartContainer.bat/sudo restartContainer.sh accordingly.  