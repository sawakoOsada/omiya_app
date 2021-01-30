class ReviewsController < ApplicationController
  before_action :set_souvenir, only: [:create, :edit, :update]
  def create
    @review = @souvenir.reviews.build(review_params)
    respond_to do |format|
      if @review.save
        format.js { render :index }
      else
        format.html { redirect_to souvenir_path(@souvenir), notice: '投稿できませんでした' }
      end
    end
  end

  def edit
    @review = @souvenir.reviews.find(params[:id])
    respond_to do |format|
      flash.now[:notice] = '編集中'
      format.js { render :edit }
    end
  end

  def update
    @review = @souvenir.reviews.find(params[:id])
    respond_to do |format|
      if @review.update(review_params)
        flash.now[:notice] = 'レビューが編集されました'
        format.js { render :index }
      else
        flash.now[:notice] = 'レビューの編集に失敗しました'
        format.js { render :edit_error }
      end
    end
  end

  def destroy
   @review = Review.find(params[:id])
   @review.destroy
   respond_to do |format|
     flash.now[:notice] = 'レビューが削除されました'
     format.js { render :index }
   end
 end
  private
  def review_params
    params.require(:review).permit(:souvenir_id, :comment, :rate)
  end

  def set_souvenir
    @souvenir = Souvenir.find(params[:souvenir_id])
  end
end
