# Evan's dotfiles

## Set up

```
$ git submodule update --init --recursive
$ make
```

## Backup Configuration

Add `backup.sh` and `logrotate` to the local crontab to manage the backups.

```
@hourly ~/.local/bin/backup.sh >> ~/.local/logs/backups/backup.log 2>> ~/.local/logs/backups/error.log
@hourly logrotate -s ~/.local/lib/logrotate/status ~/.config/logrotate.conf
```

