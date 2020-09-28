class ProposalsController < ApplicationController
  def create
    @proposal = Proposal.new(proposal_parameters)
    @need = Need.find(params[:need_id])
    @proposal.need = @need
    @proposal.user = current_user

    if @proposal.save
      flash[:success] = "Proposta alterada com sucesso!"
      redirect_to(need_path(@need))

    else
      flash.now[:notice] = "Não foi possível enviar a proposta. Por favor, preencha os campos corretamente para criar uma proposta!"
      render('needs/show')
    end
  end

  def update
    @proposal = Proposal.find(params[:id])
    @proposal.value = proposal_parameters[:value]
    @proposal.description = proposal_parameters[:description]

    @need = @proposal.need

    if @proposal.save
      redirect_to(need_path(@need), success: "Proposta salva com sucesso!")
      flash[:success] = "Proposta alterada com sucesso!"
    else
      flash.now[:notice] = "Não foi possível enviar a proposta! Por favor, preencha corretamente os campos abaixo!"
      render('needs/show')
    end
  end

  private

  def proposal_parameters
    params.require(:proposal).permit(%i[value description])
  end
end
