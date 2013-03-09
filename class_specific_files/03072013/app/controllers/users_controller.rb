class UsersController < ApplicationController

  def get
    @users = [
      {:name => "John Smith", :email => "john.smith@gmail.com"},
      {:name => "Mary Doe", :email => "mary.doe@gmail.com"}
    ]
  end
  
end