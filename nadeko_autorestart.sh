#!/bin/sh

if hash dotnet 2>/dev/null
then
	echo "Dotnet installed."
else
	echo "Dotnet is not installed. Please install dotnet."
	exit 1
fi

echo ""
echo "Linking Nadeko Credentials"
mv -n /opt/NadekoBot/src/NadekoBot/credentials.json /root/nadeko/credentials.json > /dev/null 2>&1
rm /opt/NadekoBot/src/NadekoBot/credentials.json > /dev/null 2>&1
ln -s /root/nadeko/credentials.json /opt/NadekoBot/src/NadekoBot/credentials.json > /dev/null 2>&1

#echo ""
#echo "Linking Nadeko Data Folder"
#mkdir -p /root/nadeko/data
#rsync --ignore-existing -rt /opt/NadekoBot/src/NadekoBot/bin/Release/netcoreapp2.0/data/ /root/nadeko/data/
#rm -rf /opt/NadekoBot/src/NadekoBot/bin/Release/netcoreapp2.0/data/ > /dev/null 2>&1
#ln -s /root/nadeko/data/ /opt/NadekoBot/src/NadekoBot/bin/Release/netcoreapp2.0/data > /dev/null 2>&1

# Ensure Redis is running
service redis-server start

echo ""
echo "Running NadekoBot with auto restart Please wait."
cd NadekoBot/src/NadekoBot
while :; do dotnet run -c Release; sleep 5s; done
echo "Done"

exit 0
