FRBC_RoR
========

Ruby on Rails training at FRBC.

# Class Notes

All class notes will be shown here for reference.

## 03/21/2013

* Intro [00:05:00]
	* Pray
	* http://www.code.org/ - Everyone should learn programming
* Questions and Answers [00:15:00]
* Go through all ActiveRecord actions [00:40:00]
	* Generate a model (which also generates a migration)
		```
		rails g model User name:string email:string age:integer
		```
	* Run the migration to create the _users_ table
		```
		rake db:migrate
		```
	* Create a new record
		* Using _new_
			```ruby
			user = User.new
			user.name = "Mary Smith"
			user.email = "mary.smith@gmail.com"
			user.age = 40
			user.save
			```
		* One-liner
			```ruby
			User.create(:name => "John Smith", :email => "john.smith@gmail.com", :age => 50)
			User.create(:name => "Dave Smith")
			```
	* Updating a record
		* Using _find_ and _save_
			```ruby
			user = User.find(1) # gets the user with ID of 1
			user.name = "Mary Doe"
			user.save
			```
		* One-liner
			```ruby
			user = User.find(2) # gets the user with ID of 2
			user.update_attribute(:name, "John Doe")
			```
		* Multiple attributes at once
			```ruby
			user = User.find(2) # gets the user with ID of 2
			user.update_attributes(:name => "John Smith", :age => 55)
	* Deleting a record
		```ruby
		user = User.find(3) # gets the user with ID of 3
		user.destroy
		```
	* Finding records
		```ruby
		user = User.find(1) # gets the user with ID of 1
		users = User.find(1,2) # gets the users with ID of 1 and 2
		user = User.find(100) # fails, doesn't exist
		user = User.find\_by\_id(100) # gets the user with ID of 1 but won't crash if doesn't exist
		```
	* Querying methods
		```ruby
		users = User.where("name = 'John Smith'") # unsafe but will find all users with 'John Smith'
		users = User.where("name = ?", "John Smith") # safer...does the same thing was previous
		users = User.where("name LIKE ?", "%Smith%") # users that have 'Smith' in the name
		users = User.where("name LIKE ?", "%Smith%").order("name asc") # orders by name (ascending)
		users = User.where("name LIKE ?", "%Smith%").order("name asc").limit(1) # returns only 1
		users = User.where("name LIKE ?", "%Smith%").order("name asc").limit(1).offset(1) # returns 1 starting at the offset of 1
		```
	* Named scopes
		* Add a scope to the User model
			```ruby
			scope :smiths, where("name LIKE ?", "%Smith%")
			```
		* Call the scope in the code
			```ruby
			users = User.smiths
			```
* Introduce relationships [00:15:00]
	* one-to-many
		* Generate another model - Group
			```
			rails g model Group name:string
			```
		* Add a group_id field to User
			```
			rails g migration AddGroupIdToUser
			```
			Add the following code to the migration
			```ruby
			add\_column :users, :group_id, :integer
			```
			And run the migration
			```
			rake db:migrate
			```
		* Add relationships to models
			* Add belongs\_to to User
				```ruby
				belongs\_to :group
				```
			* Add has\_many to Group
				```ruby
				has_many :users
				```
		* Create a group
			```ruby
			group = Group.create(:name => "A group")
			```
			
		* Add users to a group
			```ruby
			group = Group.find(1) # get the group with ID of 1
			group.users << User.find(1) # add user with ID 1
			group.users << User.find(2) # add user with ID 2

			puts group.users.inspect # print out all users in the group
			```
* Conclusion [00:05:00]
	* HW: Watch Models, ActiveRecord and ActiveRelation
	* Pray

__Total: 1:20:00__


## 03/14/2013

* Intro [00:05:00]
	* Pray
	* Heroku: http://heroku.com
* Questions and Answers [00:15:00]
* ~~Lynda (Controllers, Views, and Dynamic Content) [00:37:39]~~
* ~~Continue sample app (from previous class) [00:15:00]~~
	* ~~Add links to the _get_ view~~
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
	* ~~Add a _show_ action in the users controller~~
		```ruby
		def show
			@name = params[:name]
		end
		```
	* ~~Create a show.html.erb file under app/views/users/~~
		```html
		<%= @name %>
		```
	* ~~Start the server: rails s~~
	* ~~Visit http://localhost:3000~~
* Talk about Models and how they relate to databases [Inserted after class]
* Conclusion [00:05:00]
	* ~~HW: Change link to use _id_ (add to users hash) instead of _name_~~
	* HW: Watch Controllers, Views and Dynamic Content & Databases and Migrations
	* Pray

__Total: 1:17:39__

Note: You don't need to install MySQL. SQLite is fine for now.

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
			```
			match ':controller(/:action(/:id))(.:format)'
			```
		* Uncoment and modify this line:
			```
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