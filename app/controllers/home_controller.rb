class HomeController < ApplicationController
  def index
    flash.now[:success] = "Welcome to Courier app!!!"
  end
end
