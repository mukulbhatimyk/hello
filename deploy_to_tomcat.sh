# Deployment script

TOMCAT_HOME=/opt/apache-tomcat-7.0.92
TOMCAT_WEB_DIR=$TOMCAT_HOME/webapps
SOURCE_DIR=./dist

echo "Stopping tomcat server"
sudo bash $TOMCAT_HOME/bin/shutdown.sh > /dev/null 2>&1

if [ $? -eq 0 ];
 then
   echo "Tomcat services stopped successfully"
 else
   echo "Failed to stop services, please look into the logs"
fi

echo "Deployment started ......"
### Backup process

sudo rm -rf Hello*
sudo cp $SOURCE_DIR/*.war $TOMCAT_WEB_DIR

if [ $? -eq 0 ];
 then
   echo "Deployed war file successfully"
 else
   echo "Deployment failed!"
fi

echo "Tomcat server starting ....."
sudo bash $TOMCAT_HOME/bin/startup.sh > /dev/null 2>&1

if [ $? -eq 0 ];
 then
   echo "Tomcat services up and running....."
 else
   echo "Failed to start server!, please look into the logs"
fi
