#!/bin/bash

/usr/bin/git clone -b stable8 https://github.com/owncloud/core.git public
/usr/bin/git clone -b stable8 https://github.com/owncloud/3rdparty.git public/3rdparty
/usr/bin/git clone -b stable8 https://github.com/owncloud/documents.git public/apps/documents
/usr/bin/git clone -b stable8 https://github.com/owncloud/contacts.git public/apps/contacts
/usr/bin/git clone -b stable8 https://github.com/owncloud/bookmarks.git public/apps/bookmarks
/usr/bin/git clone -b stable8 https://github.com/owncloud/calendar.git public/apps/calendar
/usr/bin/git clone -b stable8 https://github.com/owncloud/gallery.git public/apps/gallery
/usr/bin/git clone -b stable8 https://github.com/owncloud/updater.git public/apps/updater
/usr/bin/git clone -b stable8 https://github.com/owncloud/apps.git public/apps2
/usr/bin/git clone https://github.com/owncloud/news.git public/apps2/news
/usr/bin/git clone https://github.com/owncloud/maps.git public/apps2/maps
/usr/bin/git clone https://github.com/owncloud/mozilla_sync.git public/apps2/mozilla_sync
/usr/bin/git clone https://github.com/owncloud/notes.git public/apps2/notes
