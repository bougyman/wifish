# Wifish

Wifish (from wifish) is meant to be very little. Design Goals are

1. List Available Wifi APs
2. Connect to an AP

That is all.

## Requirements

1. iw and wpa\_supplicant.
2. sudo, if you want to use it as non-root (highly recommend. Just do it)
3. gawk - Sorry, Multidimensional arrays and asort make this much cleaner.

## Usage

### Get it
clone this repo
```
git clone git://github.com/bougyman/wifish
```

### Configure it

*Optional* Populate /etc/wifish/interface with your interface name


### Use it

Now run wifish

```
cd wifish
./wifish
```

This should list all available APs. If you didn't populate /etc/wifish/interface you need to pass -d Interface where Interface is the name of your wifi interface

```
./wifish -d Wifi
```

Without arguments is the same as the `list` command.

```
./wifish -d Wifi list
```

## Commands

#### Currently implemented

* list - Lists all available APs (from iw scan)

#### In Progress

* connect - Connects to an AP

## Support

file a gh issue or catch me on #voidlinux on the Freenode IRC Network

