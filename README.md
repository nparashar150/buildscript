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

`sudo apt-get install git-core gnupg flex bison build-essential zip curl zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z1-dev libgl1-mesa-dev libxml2-utils xsltproc unzip fontconfig`

`sudo apt-get update && sudo apt-get upgrade`

`sudo add-apt-repository ppa:webupd8team/java`

`sudo apt install oracle-java8-installer`

Install these all and then run the script and you will be good... !!
