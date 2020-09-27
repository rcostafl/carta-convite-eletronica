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
      flash.now[:notice] = "Alguns campos percisam ser corrigidos para salvar esta necessidade. Verique abaixo quais são!"
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
    if params[:name].present? || params[:status].present? || params[:title].present?
      @needs = Need.joins(:user)
                   .where("users.name ILIKE :name \
                          AND needs.status ILIKE :status
                          AND needs.title ILIKE :title",
                          name: "%#{params[:name]}%",
                          status: "%#{params[:status]}%",
                          title: "%#{params[:title]}%")
                   .order("deadline DESC")

    else
      @needs = Need.all.order("deadline DESC")
    end
  end

  def judge
    judgement = params[:judgement]
    @need = Need.find(params[:id])
    @proposals = @need.proposals

    if judgement[:winner_proposal_id].eql?("") || judgement[:verdict].eql?("")
      flash.now[:notice] = "Não foi possível salvar o julgamento da seleção! Por favor, preencha o despacho e marque a proposta vencedora!"
      render(:show)
    else
      @proposal = Proposal.find(judgement[:winner_proposal_id])
      @proposal.winner = true

      @need.verdict = judgement[:verdict]
      @need.status = 'concluída'

      @proposal.save
      @need.save

      redirect_to need_path(@need)
      flash[:success] = "Julgamento realizado com sucesso!"
    end
  end

  private

  def need_parameters
    params.require(:need).permit(%i[title description address verdict status deadline])
  end
end
