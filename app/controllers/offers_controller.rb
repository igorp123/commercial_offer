class OffersController < ApplicationController
  before_action :set_question!, only: %i[edit update show destroy]

  def index
    @pagy, @offers = pagy(Offer.order(created_at: :desc))

    @offers = @offers.decorate
  end

  def new
    @offer = Offer.new
  end

  def create
    @offer = Offer.new(offers_params)

    if @offer.save
      flash[:success] = 'New offer created!'
      redirect_to offers_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @offer.update(offers_params)
      flash[:success] = 'The offer updated!'
      redirect_to offers_path
    else
      render :edit
    end
  end

  def show
    @offer = @offer.decorate
  end

  def destroy
    @offer.destroy

    flash[:success] = 'The offer deleted!'
    redirect_to offers_path
  end

  private

  def offers_params
    params.require(:offer).permit(:client, :body, :amount, :comment)
  end

  def set_question!
    @offer = Offer.find_by(params[:id])
  end
end
