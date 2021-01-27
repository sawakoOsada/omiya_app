class SouvenirsController < ApplicationController
  def index
    @souvenirs = Souvenir.all
  end
  def show
    @souvenir = Souvenir.find(params[:id])
  end
end
