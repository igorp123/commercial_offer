class OffersController < ApplicationController
  def index
    @offers = Offer.all
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
    @offer = Offer.find_by(params[:id])
  end

  def update
    @offer = Offer.find_by(params[:id])

    if @offer.update(offers_params)
      flash[:success] = 'The offer updated!'
      redirect_to offers_path
    else
      render :edit
    end
  end

  def show
    @offer = Offer.find_by(params[:id])
  end

  def destroy
    @offer = Offer.find_by(params[:id])

    @offer.destroy

    flash[:success] = 'The offer deleted!'

    redirect_to offers_path
  end
  private

  def offers_params
    params.require(:offer).permit(:client, :body, :amount, :comment)
  end
end
