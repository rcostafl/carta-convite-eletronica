class NeedsController < ApplicationController
  def my_needs
    @needs = Need.where("user_id = ?", current_user.id)
  end

  def show
    @need = Need.find(params[:id])

    if current_user.government
      @proposals = Proposal.where(need: @need)
    else
      @proposal = Proposal.find_by(user: current_user, need: @need)
      @proposal = Proposal.new if @proposal.nil?
    end
  end

  def new
    @need = Need.new
  end

  def create
    user = current_user
    @need = Need.new(need_parameters)
    @need.user = user

    if @need.save
      redirect_to need_path(@need)
    end
  end

  private

  def need_parameters
    params.require(:need).permit(%i[title description address verdict status deadline])
  end
end
