FRBC_RoR
========

Ruby on Rails training at FRBC.

# Class Notes

All class notes will be shown here for reference.

## 02/28/2013

* Intro [0:05:00]
	* Pray
	* How much each one knows about programming
	* Why I started the class
		* Not enough programmers...especially Christian scientists
		* Ruby on Rails encourages clean code and organized design
	* Need more programmers and scientists (God is a programmer)
* Create a sample blog [0:05:00]
	* rails new blog
	* (new window) rails g scaffold Post title body:text author; rake db:migrate; rails s
	* http://localhost:3000/posts
	* Test posts
	* validates\_presence\_of :title, validates\_presence\_of :author, validates\_uniqueness\_of :title
	* Show HTML
* Install Ruby/Rails on each machine (RVM (rvm install), RubyGems for Windows) [0:15:00]
* Create blank app and write a test page (with some rails) [0:05:00]
* Questions and help [0:10:00]
* Lynda (What is Ruby on Rails, Getting Started) [0:52:00]
* HW: Read param and output the date for (today, yesterday, tomorrow) in a view [0:05:00]

*Total: 1:37:00*

_Hint: Ruby on Rails can read parameters with the param variable. So if you pass ?name=John, params[:name] will return "John" in the Ruby controller or view._

_Hint: Time.now + 1.day will return the date for tomorrow._