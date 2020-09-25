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
      flash[:success] = "Necessidade salva com sucesso!"
    else
      flash[:notice] = "Alguns campos percisam ser corrigidos para salvar esta necessidade. Verique abaixo quais são!"
      render :new
    end
  end

  def destroy
    @need = Need.find(params[:id])

    if @need.status == 'inativa' || @need.status == 'concluída'

      flash[:alert] = "Necessidade já está #{@need.status}."
    else
      @need.status = 'inativa'
      @need.save
      flash[:notice] = "Status alterado com sucesso."
    end

    redirect_to need_path(@need)
  end

  def search
    if params[:commit].nil?
      @needs = Need.all
    else
      @needs = Need.first(2)
    end
  end

  private

  def need_parameters
    params.require(:need).permit(%i[title description address verdict status deadline])
  end
end
