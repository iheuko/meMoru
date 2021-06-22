class MemosController < ApplicationController
  def index
  end

  def new
    @memo = Memo.new
  end
end
