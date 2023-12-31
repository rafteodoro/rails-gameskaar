class OrdersController < ApplicationController
  before_action :authenticate_user!, only: %i[new create index show]
  before_action :set_game, only: %i[new create]

  def new
    @order = Order.new
  end

  def index
    @games_sold = Game.where(bought: true, user_id: current_user)
    @games_listed = Game.where(bought: false, user_id: current_user)
    @orders = Order.all.select { |m| m.user_id == current_user.id }
  end

  def create
    @order = Order.new
    @order.user = current_user
    @order.game = @game
    if @order.save
      @game.bought = true
      @game.save
      redirect_to @order
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @order = Order.find params[:id]
  end


  private

  def set_game
    @game = Game.find(params[:game_id])
  end

  def authenticate_user!
    redirect_to new_user_session_path unless user_signed_in?
    @user = current_user
  end

  def order_params
    params.require(:order).permit(:game_id)
  end
end
