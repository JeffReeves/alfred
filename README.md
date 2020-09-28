# alfred

My personal factotum and assistant.

Change wallpapers, sleep or wake the screen, get or log temperatures, etc. 

Named in homage of the loyal and tireless butler, best friend, aide-de-camp, and surrogate father figure, [Alfred Pennyworth](https://en.wikipedia.org/wiki/Alfred_Pennyworth).


## How To Use

### Install Prerequisites

Run the `install-required-commands.sh` script:

```sh
~/alfred/install-required-commands.sh
```


### Change Wallpapers via Cron

Place any desired wallpapers in the `~/Pictures/wallpapers` directory.

Run the `crontab -e` command and add the following value:

```sh
*/5 * * * * export USER=${USER}; ${HOME}/alfred/change-wallpaper.sh >> /tmp/change-wallpaper.log 2>&1
```

This will result in the wallpaper changing every five minutes.

### Macro - Morning Alarm

Edit this script to load any URL desired.

Run the `crontab -e` command and add the following:

```sh
30 6 * * * ${HOME}/alfred/macros/morning-alarm.sh
```

This will result in waking the screen and opening a URL in the 
default browser at 6:30 AM every day.


## License

The scripts contained in this repository are covered under [GPL v3.0](https://www.gnu.org/licenses/gpl-3.0.en.html)
