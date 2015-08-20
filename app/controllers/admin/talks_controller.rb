class Admin::TalksController < AdminController

  before_action :find_talk, only: [:show, :update]

  def index
    @talks = Talk.includes(:speaker).all
  end

  def show
  end

  def update
    @talk.send(params[:accept] == 'true' ? :accept! : :cancel!)
  rescue AASM::InvalidTransition => e
    flash[:error] = e.message
  ensure
    redirect_to :back
  end

  private

  def find_talk
    @talk = Talk.find(params[:id])
  end

end