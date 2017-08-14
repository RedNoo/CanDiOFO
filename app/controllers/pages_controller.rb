class PagesController < ApplicationController
  def index
    redirect_to restaurants_path if logged_in?
  end
end
