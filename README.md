FRBC_RoR
========

Ruby on Rails training at FRBC.

# Class Notes

All class notes will be shown here for reference.

## 03/14/2013

* Intro [00:05:00]
	* Pray
	* Heroku: http://heroku.com
* Questions and Answers [00:15:00]
* Lynda (Controllers, Views, and Dynamic Content) [00:37:39]
* Continue sample app (from previous class) [00:15:00]
	* Add links to the _get_ view
		```html
		<table border="1">
			<% @users.each do |user| %>
				<tr>
					<td><%= link_to(user[:name], {:action => 'show', :name => user[:name]}) %></td>
					<td><%= link_to(user[:email], "mailto:#{user[:email]}") %></td>
				</tr>
			<% end %>
		</table>

		<br><br>

		<%= Time.now %>
		```
	* Add a _show_ action in the users controller
		```ruby
		def show
			@name = params[:name]
		end
		```
	* Create a show.html.erb file under app/views/users/
		```html
		<%= @name %>
		```
	* Start the server: rails s
	* Visit http://localhost:3000
* Conclusion [00:05:00]
	* HW: Change link to use _id_ (add to users hash) instead of _name_
	* Pray

__Total: 1:17:39__

_Hint: Methods return the last code in the method. You can add an array inside a method to be used by multiple methods in the controller. Calling all\_users inside the controller will give you the array of users._

    def all_users
		[
			{:id => 1, :name => "John Smith", :email => "john.smith@gmail.com"}
		]
	end

_Hint: An array can be searched using the select method. It will return all items in the array that match the condition inside the block ({|u| condition })._

	@name = all_users.select{|u| u[:id] == params[:id].to_i}.first[:name]


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
	* Create app/controller/users_controller.rb
		```ruby
		class UsersController < ApplicationController

		  def get
		    @users = [
		      {:name => "John Smith", :email => "john.smith@gmail.com"},
		      {:name => "Mary Doe", :email => "mary.doe@gmail.com"}
		    ]
		  end

		end
		```
	* Create directory app/views/users
	* Create app/views/users/get.html.erb
		```html
		<table border="1">
		<% @users.each do |user| %>
			<tr>
				<td><%= user[:name] %></td>
				<td><%= user[:email] %></td>
			</tr>
		<% end %>
		</table>

		<br><br>

		<%= Time.now %>
		```
	* Modify config/routes.rb
		* Uncomment this line:
			```ruby
			match ':controller(/:action(/:id))(.:format)'
			```
		* Uncoment and modify this line:
			```ruby
			root :to => 'users#get'
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