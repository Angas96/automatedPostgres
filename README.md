# README.md

**Install docker (https://www.docker.com/)**
```batch
run.bat
```
You can either use the provided dockerscript.sh or the commands below to install Docker for Linux.

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

**How to insert Data into the Database**

To insert Data into the Database you simply have to start the Project with the run.sh/run.bat File. 
If there is a need to change the already given Files, you can simply change the getDataFromFiles.sh for the right files, the code for it is self explanatory. 

**.env File Variables**

POSTGRES_API_KEY_OPEN= API KEY  
POSTGRES_API_KEY_METGIS= API KEY  
POSTGRES_USER= User for postgres Database  
POSTGRES_PASSWORD= Password for postgres Database  
POSTGRES_DB= Name of the postgres Database   
POSTGRES_PORT= Port of the postgres Database  
POSTGRES_CITY= City which weather data should be collected from  
POSTGRES_LAT= Latitude of the City  
POSTGRES_LON= Longitude of the City  
POSTGRES_ZIPCODE= Zipcode of the City  
POSTGRES_UNITS_OPEN= Metrics for the Openweather API (use 'metric' as default)  
POSTGRES_OPENWEATHERLINK= Link for Openweather (please take it from the template)  
POSTGRES_METGISLINK_CURRENT= Link for Metgis (please take it from the template)  
POSTGRES_OPENWEATHERLINK_FORECAST= Link for Openweather (please take it from the template)  
POSTGRES_METGISLINK_FORECAST= Link for Metgis (please take it from the template)  
PGADMIN_DEFAULT_EMAIL= Email for pgadmin Login  
PGADMIN_DEFAULT_PASSWORD= Password for pgadmin Login  
MIN_TEMP= Minimum Temperature  
MAX_TEMP= Maximum Temperature  
MIN_HUMIDITY= Minimum Humidity  
MAX_HUMIDITY= Maximum Humidity  
MIN_PRESSURE= Minimum Pressure  
MAX_PRESSURE= Maximum Pressure  
MIN_WIND_SPEED= Minimum Windspeed  
MAX_WIND_SPEED= Maximum Windspeed  
