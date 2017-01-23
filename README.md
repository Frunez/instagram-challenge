Depictorama
===========

Instagram clone-ish
------

A ruby rails web application where you can upload images which are displayed on main page, people can click on said images view them and make comments like 'Aw, so cute!' (may add smiley face generator for giggles).

This application uses Rails 5.0.1 and Ruby 2.4.0 as well as Rspec and Capybara for testing.

List of features
-----
implemented: :white_check_mark:  not implemented yet: :no_entry_sign:

* Add image (name and category) :white_check_mark:
* Upload image :no_entry_sign:
* Hompage with list of uploaded images :white_check_mark:
* Sign up :white_check_mark:
* O-auth sign up :no_entry_sign:
* Sign in & sign out :white_check_mark:
* User profile :no_entry_sign:
* Viewing other user's uploads :no_entry_sign:
* View images by category :no_entry_sign:

extra features:

* Auto emojifier :no_entry_sign:
* Video upload :no_entry_sign:
* Featured images :no_entry_sign:
* :thumbsup: images :no_entry_sign:
* Ordering images by most liked, most recent, most viewed etc. :no_entry_sign:

How to use
--------
* Step uno: fork this repository then $git clone git@github.com:<YOUR_USERNAME>/instagram-challenge.git
* Step two: cd to file and $ bundle install
* Step three: turn kettle on and wait 2-5 minutes
* Step four: get those databases up and running $ rake db:create
* Step five: $ rake db:migrate
* Step six: you should now be ready to start ze server $ rails s
* Step seven: go to localhost:3000 on browser
* Step eight: click stuff
