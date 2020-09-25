class PagesController < ApplicationController
  def home
  end

  def my_page
    if current_user.government
      @needs = Need.where("user_id = ?", current_user.id)
    else
      @needs = Need.joins("INNER JOIN proposals ON proposals.need_id = needs.id INNER JOIN users ON users.id = proposals.user_id").where("users.id = ?", current_user.id)
    end
  end
end
