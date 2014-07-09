class NominationsController < ApplicationController
  before_action :set_nomination, only: [:show]

  def new
    @nomination = Nomination.new
  end

  def create
    @nomination = Nomination.new(nomination_params)

    if @nomination.save
      redirect_to root_path
    else
      render :new
    end
  end

  def verify
    nomination = Nomination.verify(params[:token])

    if nomination
      redirect_to root_path, notice: 'Your nomination has been successfully submitted!'
    else
      redirect_to root_path, alert: 'Oops!  You missed something'
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def nomination_params
      params.require(:nomination).permit(:name, :email)
    end
  
end