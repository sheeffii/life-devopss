#Download the Grafana GPG key with wget, then pipe the output to gpg. This will 
#convert the GPG key from base64 to binary format. Then pipe the output to tee to store 
#the key in the /usr/share/keyrings/grafana.gpg file.
wget -q -O - https://packages.grafana.com/gpg.key | gpg --dearmor | sudo tee /usr/share/keyrings/grafana.gpg > /dev/null

#Next, add the Grafana repository to your APT sources:
echo "deb [signed-by=/usr/share/keyrings/grafana.gpg] https://packages.grafana.com/oss/deb stable main" | sudo tee -a /etc/apt/sources.list.d/grafana.list


#Refresh your APT cache to update your package lists:
sudo apt update -y

sudo apt install grafana

### NOT starting on installation, please execute the following statements to configure grafana to 
#start automatically using systemd
 sudo /bin/systemctl daemon-reload
 sudo /bin/systemctl enable grafana-server
 sudo /bin/systemctl start grafana-server

sudo systemctl status grafana-server
