# noob_buildscript
This is the build script which includes how to sync &amp; how to configure &amp; how to build ROM... Change it as per your rom you just need a bit of tweaking... !! 

It will be a good gesture if you don't kang it ... !! Just Fork it ... |'`-_-`'|

Configure it as per your ROM
Remove ZRam and Metalava lines if you have more than 8Gb of ram 
As I have 8Gb so I need these patches 

Give it the permission it needs by `chown`

Before running this script install tools to setup build environment


`sudo apt-get update && sudo apt-get upgrade `

`sudo dpkg --add-architecture i386`

`sudo apt-get update && sudo apt-get upgrade `

`sudo apt-get install bc bison build-essential curl flex g++-multilib gcc-multilib git gnupg gperf lib32ncurses5-dev lib32readline6-dev lib32z1-dev libesd0-dev liblz4-tool libncurses5-dev libsdl1.2-dev libwxgtk2.8-dev libxml2 libxml2-utils lzop pngcrush schedtool squashfs-tools xsltproc zip zlib1g-dev imagemagick`

`sudo apt-get update && sudo apt-get upgrade`

`sudo add-apt-repository ppa:webupd8team/java`

`sudo apt install oracle-java8-installer`

Install these all and then run the script and you will be good... !!
