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
+ touch app/views/static/about.html.erb (creates view file)
+ mv app/views/layouts/application.html.erb layout_file (creates layout file)

Add page titles
assert_select "title", "Home | Ruby on Rails Tutorial Sample App" (test controller)

Variable title
<% provide(:title, "Help") %>
<%= yield(:title) %>

Finish static pages
$ git add -A
$ git commit -m "Finish static pages"
$ git checkout master
$ git merge static-pages
$ git push
$ bundle exec rake test
$ git push heroku

Include entire Bootstrap CSS framework
@import "bootstrap-sprockets";
@import "bootstrap";

Partials
<%= render 'layouts/header' %>

Asset pipeline
(Assets that are optimized to be efficient in a production application)
app/assets: assets specific to the present application
lib/assets: assets for libraries written by your dev team
vendor/assets: assets from third-party vendors

// the asset pipeline combines all the application stylesheets into one CSS file (application.css), combines all the application JavaScript into one JavaScript file (application.js), and then minifies them to remove the unnecessary spacing and indentation that bloats file size. The result is the best of both worlds: convenience in development and efficiency in production.//

Filename extension
.scss for Sass (adds features to css)
.coffee for CoffeeScript (compiles to javascript)
.erb for embedded Ruby (ERb)

foobar.js.erb.coffee (filename extension chaining)

Better 
<!-- <a href="/static_pages/about">About</a> -->
<!-- <%= link_to "About", about_path %> -->

Home	/	root_path
About	/about	about_path
Help	/help	help_path
Contact	/contact	contact_path
Sign up	/signup	signup_path
Log in	/login	login_path

Add page
route -> get  'static_pages/contact'
controller -> def contact
 			  end
view -> ...

root_path -> '/' (direct)
root_url  -> 'http://www.example.com/' (redirect)

root             'static_pages#home'
# help_path -> '/help'
# help_url  -> 'http://www.example.com/help'
get 'help'    => 'static_pages#help'

Layout link test (test layout files)
$ rails generate integration_test site_layout
steps:
1 Get the root path (Home page)
2 Verify that the right page template is rendered
3 Check for the correct links to the Home, Help, About, and Contact pages

(test/integration/site_layout_test)
require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest

  test "layout links" do
    get root_path
    assert_template 'static/home'
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", help_path
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", contact_path
  end
end

assert_select "a[href=?]", about_path
=== <!-- <a href="/about">...</a> -->

bundle exec rake test:integration

Signup Users
rails g controller Users new (create Users controller)
bundle exec rake test (test User page)
(view - users/new.html.erb)
(routes)

rails console --sandbox

User
user.update_attribute(:name, "The Dude")

validates(:name, presence: true) (user.model)
test "name should be present" do
    @user.name = "        "
    assert_not @user.valid?
  end (user test)

rails generate migration add_index_to_users_email (db)
add_index :users, :email, unique: true (class in db)
bundle exec rake db:migrate (terminal)
(test/fixtures/users.yml)
one:
  name: MyString
  email: MyString

two:
  name: MyString
  email: MyString

 callback, which is a method that gets invoked at a particular point in the lifecycle of an Active Record object.

 before_save callback to downcase the email attribute before saving the user

 before_save { self.email = email.downcase } (user model)

 add a way to authenticate a user based on a given password
 has_secure_password (user model)
 The only requirement for has_secure_password to work its magic is for the corresponding model to have an attribute called password_digest
 rails generate migration add_password_digest_to_users password_digest:string (terminal)
gem 'bcrypt','3.1.7' 
To make the password digest, has_secure_password uses a state-of-the-art hash function called bcrypt. By hashing the password with bcrypt, we ensure that an attacker won’t be able to log in to the site even if they manage to obtain a copy of the database.

!!user.authenticate("foobar") foobar is a password


Please feel free to use a different markup language if you do not plan to run
<tt>rake doc:app</tt>.
