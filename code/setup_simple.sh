#!/bin/bash

IYellow='\e[93m'      # Yellow
reset='\e[0m'         # reset

#sudo apt-get update && sudo apt-get dist-upgrade -y && sudo apt-get autoremove -y && sudo apt-get autoclean
echo "Updating OS, please wait..."

sudo apt-get update && sudo apt-get dist-upgrade -y

#sudo apt-get update
#echo "UpGrading OS, please wait..."
#sudo apt-get upgrade

echo "Installing XRDP, please wait..."
sudo apt-get install xrdp -y

echo "0 = ENABLED, 1 = DISABLED"
#sudo raspi-config nonint do_camera 0
cam=$(sudo raspi-config nonint get_camera 0)
if [ $cam == 0 ]
then
 echo "Camera Enabled"
else
 echo "Camera is Disabled, enabeling it now"
 sudo raspi-config nonint do_camera 0
 echo "Camera is Enabled."
fi

#sudo raspi-config nonint do_ssh 0

varssh=$(sudo raspi-config nonint get_ssh 0)
if [ $varssh == 0 ]
then
 echo "SSH Enabled"
else
 echo "SSH is Disabled, enabeling it now"
 sudo raspi-config nonint do_ssh 0
 echo "SSH is Enabled."
fi

#sudo raspi-config nonint do_vnc 0

varVNC=$(raspi-config nonint get_vnc 0)
if [ $varVNC == 0 ]
then
 echo "VNC Enabled"
else
 echo "VNC is Disabled, enabeling it now"
 sudo raspi-config nonint do_vnc 0
 echo "VNC is Enabled."
fi

#sudo raspi-config nonint do_rgpio 0

varRGPIO=$(raspi-config nonint get_rgpio 0)
if [ $varRGPIO == 0 ]
then
 echo "Remote GPIO Enabled"
else
 echo "Remote GPIO is Disabled, enabeling it now"
 sudo raspi-config nonint do_rgpio 0
 echo "Remote GPIO is Enabled"
fi

#echo "Installing node js"
#curl -o node-v9.7.1-linux-armv6l.tar.gz https://nodejs.org/dist/v9.7.1/node-v9.7.1-linux-armv6l.tar.gz
#tar -xzf node-v9.7.1-linux-armv6l.tar.gz
#sudo cp -r node-v9.7.1-linux-armv6l/* /usr/local/
#node -v && npm -v
#echo "node js installed successfully"

#!/bin/bash

#read -p "$(echo -e $IYellow "Do you want to setup email? (Y/N): "$reset)" wantToSetupEmail
#read -p "$(echo -e $IYellow "Enter 'To: ' email: "$reset)" toEmail
#read -p "$(echo -e $IYellow "Enter 'From: ' email (gmail account): "$reset)" fromEmail
#read -sp "$(echo -e $IYellow "Enter your gmail password: "$reset)" gmailPassword

#python3 -c'import mail; mail.initValues("'$toEmail'", "'$fromEmail'", "'$gmailPassword'")'

#write out current crontab
crontab -l > dashcamcron
#echo new cron into cron file
echo "@reboot python3 /home/pi/Raspi_DashCam/code/dashCam.py >>/home/pi/Raspi_DashCam/code/log.log 2>&1" >> dashcamcron
#echo "@reboot sudo /usr/local/bin/node /home/pi/Raspi_DashCam/code/web/app.js >>/home/pi/Raspi_DashCam/code/log.log 2>&1" >> dashcamcron
crontab dashcamcron
rm dashcamcron

#if [ "$wantToSetupEmail" == "Y" ]
#then
#    echo "adding mailer cron job"
#    crontab -l > dashcamcron
#    echo "@reboot sleep 300 && python3 /home/pi/Raspi_DashCam/code/mailer.py >>/home/pi/Raspi_DashCam/code/log.log 2>&1" >> dashcamcron
#    #install new cron file
#    crontab dashcamcron
#    rm dashcamcron
#fi

sudo timedatectl set-timezone America/New_York

#sudo raspi-config nonint get_hostname
sudo raspi-config nonint do_resolution 1920 1080

#echo "install web app dependencies"
#sudo npm install /home/pi/Raspi_DashCam/code/web
#echo "web app dependencies installed successfully."

#/bin/bash apSetup.sh dashcam

#define SET_HOSTNAME    "sudo raspi-config nonint do_hostname %s"
#define GET_BOOT_CLI    "sudo raspi-config nonint get_boot_cli"
#define GET_AUTOLOGIN   "sudo raspi-config nonint get_autologin"
#define SET_BOOT_CLI    "sudo raspi-config nonint do_boot_behaviour B1"
#define SET_BOOT_CLIA   "sudo raspi-config nonint do_boot_behaviour B2"
#define SET_BOOT_GUI    "sudo raspi-config nonint do_boot_behaviour B3"
#define SET_BOOT_GUIA   "sudo raspi-config nonint do_boot_behaviour B4"
#define GET_BOOT_WAIT   "sudo raspi-config nonint get_boot_wait"
#define SET_BOOT_WAIT   "sudo raspi-config nonint do_boot_wait %d"
#define GET_SPLASH      "sudo raspi-config nonint get_boot_splash"
#define SET_SPLASH      "sudo raspi-config nonint do_boot_splash %d"
#define GET_OVERSCAN    "sudo raspi-config nonint get_overscan"
#define SET_OVERSCAN    "sudo raspi-config nonint do_overscan %d"
#define GET_CAMERA      "sudo raspi-config nonint get_camera"
#define SET_CAMERA      "sudo raspi-config nonint do_camera %d"
#define GET_SSH         "sudo raspi-config nonint get_ssh"
#define SET_SSH         "sudo raspi-config nonint do_ssh %d"
#define GET_VNC         "sudo raspi-config nonint get_vnc"
#define SET_VNC         "sudo raspi-config nonint do_vnc %d"
#define GET_SPI         "sudo raspi-config nonint get_spi"
#define SET_SPI         "sudo raspi-config nonint do_spi %d"
#define GET_I2C         "sudo raspi-config nonint get_i2c"
#define SET_I2C         "sudo raspi-config nonint do_i2c %d"
#define GET_SERIAL      "sudo raspi-config nonint get_serial"
#define GET_SERIALHW    "sudo raspi-config nonint get_serial_hw"
#define SET_SERIAL      "sudo raspi-config nonint do_serial %d"
#define GET_1WIRE       "sudo raspi-config nonint get_onewire"
#define SET_1WIRE       "sudo raspi-config nonint do_onewire %d"
#define GET_RGPIO       "sudo raspi-config nonint get_rgpio"
#define SET_RGPIO       "sudo raspi-config nonint do_rgpio %d"
#define GET_PI_TYPE     "sudo raspi-config nonint get_pi_type"
#define GET_OVERCLOCK   "sudo raspi-config nonint get_config_var arm_freq /boot/config.txt"
#define SET_OVERCLOCK   "sudo raspi-config nonint do_overclock %s"
#define GET_GPU_MEM     "sudo raspi-config nonint get_config_var gpu_mem /boot/config.txt"
#define GET_GPU_MEM_256 "sudo raspi-config nonint get_config_var gpu_mem_256 /boot/config.txt"
#define GET_GPU_MEM_512 "sudo raspi-config nonint get_config_var gpu_mem_512 /boot/config.txt"
#define GET_GPU_MEM_1K  "sudo raspi-config nonint get_config_var gpu_mem_1024 /boot/config.txt"
#define SET_GPU_MEM     "sudo raspi-config nonint do_memory_split %d"
#define GET_HDMI_GROUP  "sudo raspi-config nonint get_config_var hdmi_group /boot/config.txt"
#define GET_HDMI_MODE   "sudo raspi-config nonint get_config_var hdmi_mode /boot/config.txt"
#define SET_HDMI_GP_MOD "sudo raspi-config nonint do_resolution %d %d"
#define GET_WIFI_CTRY   "sudo raspi-config nonint get_wifi_country"
#define SET_WIFI_CTRY   "sudo raspi-config nonint do_wifi_country %s"
#define CHANGE_PASSWD   "(echo \"%s\" ; echo \"%s\" ; echo \"%s\") | passwd"
#END
