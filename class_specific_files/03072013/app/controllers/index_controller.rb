class IndexController < ApplicationController

  def index
    @users = [
      {:name => "John Smith", :email => "john.smith@gmail.com"},
      {:name => "Mary Doe", :email => "mary.doe@gmail.com"}
    ]
  end

end