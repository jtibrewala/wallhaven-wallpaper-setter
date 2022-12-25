# wallhaven-wallpaper-setter
Set random wallpaper from wallhaven based on your search criteria

add it to crontab. that's the preferred way to run it. i have set it to run from 8am - 9pm everyday on my macbook.  Use the appropriate script for linux. Use [cron guru](https://crontab.guru/) in case you need to test your cron setting.

0 8-21 * * * cd ~/github/wallhaven-wallpaper-setter/ && sh ./mac-wallhaven.sh
