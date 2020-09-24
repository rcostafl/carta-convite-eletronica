class PagesController < ApplicationController
  def home
  end

  def my_page
    if current_user.government
      @needs = Need.where("user_id = ?", current_user.id)
    else
      @needs = Need.all
    end
  end
end
