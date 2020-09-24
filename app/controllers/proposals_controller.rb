class ProposalsController < ApplicationController
  def create
    @proposal = Proposal.new(proposal_parameters)
    @need = Need.find(params[:need_id])
    @proposal.need = @need
    @proposal.user = current_user

    if @proposal.save
      redirect_to need_path(@need)
    else
      render('needs/show')
    end
  end

  def update
    @proposal = Proposal.find(params[:id])
    @proposal.value = proposal_parameters[:value]
    @proposal.description = proposal_parameters[:description]

    @need = @proposal.need

    if @proposal.save
      redirect_to need_path(@need)
    else
      render('needs/show')
    end
  end

  private

  def proposal_parameters
    params.require(:proposal).permit(%i[value description])
  end
end
