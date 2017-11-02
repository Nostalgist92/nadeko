# NadekoBot for Discord within docker
Nadeko is written in C# and Discord.net for more information visit https://github.com/Kwoth/NadekoBot

Full Documentation available @ http://nadekobot.readthedocs.io/en/latest/guides/Docker%20Guide/

### Install

    docker create --name=nadeko -v /nadeko/conf/:/root/nadeko -v /nadeko/data:/opt/NadekoBot/src/NadekoBot/bin/Release/netcoreapp2.0/data nozza/nadeko:latest
	
Where `/nadeko/conf` is where you want your config files, and `/nadeko/data` is where you want your data files
(Your credentials.json will be in the conf folder) [More on that here](http://nadekobot.readthedocs.io/en/latest/JSON%20Explanations/)

### Start

With monitoring: `docker start nadeko; docker logs -f nadeko`
Without monitoring: `docker start nadeko`

### Update (Manual)

    docker pull nozza/nadeko:latest
    docker stop nadeko; docker rm nadeko
    docker create --name=nadeko -v /nadeko/conf/:/root/nadeko -v /nadeko/data:/opt/NadekoBot/src/NadekoBot/bin/Release/netcoreapp2.0/data nozza/nadeko:latest
	
### Update (Auto)

	docker run -d --name watchtower -v /var/run/docker.sock:/var/run/docker.sock centurylink/watchtower --cleanup nadeko
	
This will check for updates to the docker every 5 minutes and update immediately. Alternatively using the `--interval X` command to change the interval, where X is the amount of time in seconds to wait. e.g 21600 for 6 hours.