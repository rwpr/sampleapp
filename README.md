== README

This is the sample application for the
[*Ruby on Rails Tutorial:
Learn Web Development with Rails*](http://www.railstutorial.org/)
by [Michael Hartl](http://www.michaelhartl.com/).

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

Make a new branch:
$ git checkout master
$ git checkout -b static-pages

rails generate controller StaticPages home help

rails s (server)
rails c (console)
rails g (generate)
bundle (bundle install)
rake (rake test)

Merge: From branch to master (Adding master with/without changes with branch)
Push: From master to branch (Overwriting the master)

$ rails generate controller StaticPages home help
$ rails destroy  controller StaticPages home help

Migrate:
Undo a single migration step using
	$ bundle exec rake db:rollback

To go all the way back to the beginning, we can use
  $ bundle exec rake db:migrate VERSION=0

Test:
Controller
Model
Integration

be rake test
+ get 'static_pages/about' (routes)
+ def about (controller)
  end
+ touch app/views/static/about.html.erb (creates view)
+ mv app/views/layouts/application.html.erb layout_file (creates layout file)

Add page titles
assert_select "title", "Home | Ruby on Rails Tutorial Sample App" (test controller)

Variable title
<% provide(:title, "Help") %>
<%= yield(:title) %>

Please feel free to use a different markup language if you do not plan to run
<tt>rake doc:app</tt>.
