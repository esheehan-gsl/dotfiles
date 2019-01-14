#!/bin/sh

# Disable file globbing to prevent bash expanding the exclusion patterns
# passed to duplicity
set -f

BACKUP_DIR=$HOME

# Ignore the Downloads directory, cruft created by the snap package manager,
# config files in the home directory, and any development files
EXCLUDE_LIST="Downloads snap .* **/.git **/node_modules"

# Minimum time between incremental backups: 30 days
# Do a full backup if the last backup was too long ago.
MIN_TIME_BETWEEN="30D"

# Maximum period for which backups are kept: 60 days
# Delete any backups older than this window
BACKUP_WINDOW="60D"

# Fill these in with secrets!
B2_ID=""
B2_KEY=""
B2_BUCKET=""

ENC_KEY=""
SGN_KEY=""

export PASSPHRASE=""
export SIGN_PASSPHRASE=""

FLAGS="--sign-key $SGN_KEY --encrypt-key $ENC_KEY"

TARGET="b2://$B2_ID:$B2_KEY@$B2_BUCKET"

EXCLUDES=""
for pattern in $EXCLUDE_LIST
do
    EXCLUDES=$EXCLUDES" --exclude $BACKUP_DIR/$pattern"
done

echo "==============================================="
echo "BACKUP STARTED ($BACKUP_DIR) `date`"
echo "==============================================="

# Delete old backups
duplicity remove-older-than $BACKUP_WINDOW \
    $FLAGS \
    --force \
    $TARGET

# Backup
duplicity \
    $FLAGS \
    $EXCLUDES \
    --full-if-older-than $MIN_TIME_BETWEEN \
    $BACKUP_DIR \
    $TARGET

# Clean up
duplicity cleanup \
    --force \
    $TARGET

duplicity collection-status \
    $FLAGS \
    $TARGET

unset B2_ID
unset B2_KEY
unset B2_BUCKET
unset BACKUP_DIR
unset EXCLUDE_LIST
unset MIN_TIME_BETWEEN
unset BACKUP_WINDOW
unset ENC_KEY
unset SGN_KEY
unset PASSPHRASE
unset SIGN_PASSPHRASE

