# Scripts used to trigger Catalyst SD-WAN Security policies (IPS, URL-F, AMP)

Filenames:

amp-traffic.sh : bash script that parses a text file filled with URLs that host malicious files to download. Uses amp-url-list.txt as input and will go through each URL and attempt to download it using wget. AMP will intercept and block attempt and will be seen on vManage.

ips-traffic.sh : bash script that parses a text file filled with URLs that host malicious files to download with known IPS signatures. Uses ips-list.txt as input and will go through each URL and attempt to download it using wget. Snort IPS will intercept and block attempt and will be seen on vManage.

url-traffic.sh : bash script that parses a text file filled with URLs of different categories (sports, gambling, beauty, social media, etc.). Uses shuffled-url-list.txt as input and will go through each URL and attempt to download it using wget. URL-F engine will intercept and block/allow based on categories/reputation and will be seen on vManage.

ping.sh : bash script that takes in $IP_ADDRESS as argument and pings that IP address 10 times to generate FW traffic. Edit file to IP address of choice depending on FW rules created on Unified Security Policy or UX 2.0.


Steps to run the scripts:

1. user$ ./amp-traffic.sh amp-url-list.txt

2. user$ ./ips-traffic.sh ips-list.txt

3. user$ ./url-traffic.sh shuffled-url-list.txt

4. user$ ./ping.sh


Or you can run them as cronjobs to run automatically at a specified interval

user$ crontab -e

*/5 * * * * cd /path/to/files/ && ./url-traffic.sh shuffled-url-list.txt

*/10 * * * * cd /path/to/files/ && ./amp-traffic.sh amp-url-list.txt

*/3 * * * * cd /path/to/files/ping.sh
