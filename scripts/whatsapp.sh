#!/bin/bash
echo ""
echo "Welcome to WhatsApp Web Script."
echo "This script will create a desktop app for you."
rm -rf /usr/share/applications/whatsapp-webapp.desktop
printf '#!/usr/bin/env xdg-open' '[Desktop Entry]' 'Name=WhatsApp' 'GenericName=WhatsApp' 'Comment=WhatsApp desktop webapp' 'Exec=/opt/google/chrome/google-chrome --app=https://web.whatsapp.com/' 'Terminal=false' 'Type=Application' 'StartupNotify=true' 'MimeType=text/plain;' '# If you want icon, type path of icon' '# Icon=' 'Categories=Network;Application;' 'Keywords=WhatsApp;webapp;' 'X-Ubuntu-Gettext-Domain=WhatsApp' 'StartupWMClass=web.whatsapp.com' >/usr/share/applications/whatsapp-webapp.desktop
sudo apt install wmctrl
bash -c "wmctrl -xa web.whatsapp.com || /opt/google/chrome/google-chrome --app=https://web.whatsapp.com/"
echo "I hope you liked my script."
echo -e '\e]8;;https://github.com/nparashar150/\aFollow Me for more support.\e]8;;\a'
echo "Done"
echo "Exiting in 5 seconds"
echo -ne '######                    (33%)\r'
sleep 1
echo -ne '#############             (66%)\r'
sleep 3
echo -ne '#######################  (100%)\r'
echo -ne '\n'