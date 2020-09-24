class NeedsController < ApplicationController
  def new
    @need = Need.new
  end

  def create
    user = current_user
  end

end
