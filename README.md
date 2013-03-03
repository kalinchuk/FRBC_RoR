FRBC_RoR
========

Ruby on Rails training at FRBC.

# Class Notes

All class notes will be shown here for reference.

## 03/07/2013

* Intro [00:03:00]
	* Pray
	* Sites on Rails: Hulu, Github, YP, Twitter
* Questions and Answers [00:15:00]
* Lynda (What is Ruby on Rails, Getting Started) [00:52:00]
* Create sample app from scratch [00:15:00]
	* rails new app_name
	* cd app_name
	* Remove public/index.html
	* Create app/controller/index_controller.rb
		```ruby
		class IndexController < ApplicationController

		  def index
		    @users = [
		      {:name => "John Smith", :email => "john.smith@gmail.com"},
		      {:name => "Mary Doe", :email => "mary.doe@gmail.com"}
		    ]
		  end

		end
		```
	* Create directory app/views/index
	* Create app/views/index/index.html.erb
		```rails
		<table border="1">
		<% @users.each do |user| %>
			<tr>
				<td><%= user[:name] %></td>
				<td><%= user[:email] %></td>
			</tr>
		<% end %>
		
		<br><br>
		
		<%= Time.now %>
		</table>
		```
	* Modify config/routes.rb, uncomment this line:
		```ruby
		match ':controller(/:action(/:id))(.:format)'
		```
	* rails s (start the server)
	* Visit [http://localhost:3000/index/index](http://localhost:3000/index/index)
* Conclusion [00:08:00]
	* HW: Create additional users and fields (:location, :age, :gender)
	* Github (https://github.com/kalinchuk/FRBC_RoR)
	* For end of class: Create an app: Ask a Pastor
	* Pray
	
__Total: 1:35:00__
	

## 02/28/2013

* Intro [00:05:00]
	* Pray
	* How much each one knows about programming
	* Why I started the class
		* Not enough programmers...especially Christian scientists
		* Ruby on Rails encourages clean code and organized design
	* Need more programmers and scientists (God is a programmer)
	* Format: Intro, Review HW (Questions), Lynda, Write code
* Create a sample blog [00:05:00]
	* rails new blog
	* (new window) rails g scaffold Post title body:text author; rake db:migrate; rails s
	* http://localhost:3000/posts
	* Test posts
	* validates\_presence\_of :title, validates\_presence\_of :author, validates\_uniqueness\_of :title
	* Show HTML
* Install Ruby/Rails on each machine (RVM (rvm install), RubyGems for Windows) [00:15:00]
* Create blank app and write a test page (with some rails) [00:05:00]
* Questions and help [00:10:00]
* ~~Lynda (What is Ruby on Rails, Getting Started) [00:52:00]~~
* ~~Conclusion [00:08:00]~~
	* ~~HW: Read param and output the date for (today, yesterday, tomorrow) in a view~~
	* ~~Github~~
	* ~~For end of class: Create an app: Ask a Pastor~~
	* Pray

__Total: 1:40:00__

_Hint: Ruby on Rails can read parameters with the param variable. So if you pass ?name=John, params[:name] will return "John" in the Ruby controller or view._

    <%= params[:name] %>

_Hint: Time.now + 1.day will return the date for tomorrow._

    <%= Time.now + 1.day %>