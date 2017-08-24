class PagesController < ApplicationController
  def index
    redirect_to new_restaurants_list_path if logged_in?
    redirect_to restaurants_path if logged_in_user?
  end
end
