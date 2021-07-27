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
    @memo = memo_find
  end 

  def edit
    @memo = memo_find
  end

  def update
    memo = memo_find
    if memo.update(memo_params)
      redirect_to memo_path(params[:id])
    else
      @memo = memo_find
      render :edit
    end
  end

  def destroy
    memo = memo_find
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

  def memo_find
    Memo.find(params[:id])
  end

end
