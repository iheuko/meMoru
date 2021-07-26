class MemosController < ApplicationController
  def index
    if user_signed_in?
      @memos = current_user.memos
    end
  end

  def new
    @memo = Memo.new
  end

  def create
    @memo = Memo.new(memo_params)
    if @memo.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @memo = Memo.find(params[:id])
  end 

  def edit
    @memo = Memo.find(params[:id])
  end

  def update
    memo = Memo.find(params[:id])
    if memo.update(memo_params)
      redirect_to memo_path(params[:id])
    else
      @memo = Memo.find(params[:id])
      render :edit
    end
  end

  def destroy
    memo = Memo.find(params[:id])
    memo.destroy
    redirect_to root_path
  end

  def search
    @memos = Memo.search(params[:keyword])
    @keyword = params[:keyword]
    render "index"
  end

  private

  def memo_params
    params.require(:memo).permit(:memo_title, :memo, :frame_type_id).merge(user_id: current_user.id)
  end
end
