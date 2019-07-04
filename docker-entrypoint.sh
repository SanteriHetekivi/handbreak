#!/bin/sh

# Get user and group ids or use defaults.
PUID=${PUID:-911}
PGID=${PGID:-911}

# Change app users group and userid to given.
groupmod -o -g "$PGID" app
usermod -o -u "$PUID" app

# Add all data owned my app user.
chown -R app:app /app
chown -R app:app /data
chown -R app:app /usr/src/app

# Run given command.
exec gosu app "$@"