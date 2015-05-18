<p align="center">
![Setlist Logo](https://raw.github.com/JoeChester/setlist/master/app/assets/images/favicon/android-icon-192x192.png)

Setlist
=======

Your new little helper app for musician/band rehearsals.
Created as a project for my Ruby on Rails Class at
university.

##Try it out!
[Deployed version on heroku](http://set-list.herokuapp.com/).

Development
-----------

Prequisites: Developed using

	Ruby v.2.1.5

To initialize, just run

	bin/setup

which should migrate a development and a test database automatically.
Test it by running

	bin/rake test

###Additional Information
For evaluation at university:

	- 4 related, validated models
	- many-to-many relation between songs and playlists
	- 43 tests, 95% code coverage according to simplecov
	- nested forms for assigning songs to playlists
	- uses devise as additional library
	- and for user authentication (instead of has_secure_password)

Created by
----------
Jonas Kleinkauf, TINF12B1
