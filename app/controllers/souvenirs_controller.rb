class SouvenirsController < ApplicationController
  def index
    @q = Souvenir.ransack(params[:q])
    @souvenirs = @q.result(distinct: true)
  end
  def show
    @souvenir = Souvenir.find(params[:id])
  end
end
