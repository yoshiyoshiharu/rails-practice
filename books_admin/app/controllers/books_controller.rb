class BooksController < ApplicationController
  # フックで処理を差し込む
  before_action :set_book, only: [:show, :destroy] # except: []でonlyの逆
  # around_actionはyieldで処理を挟み込む必要あるので注意
  # 親クラスなどで定義したフックをスキップしたいときはskip_before_actionなどとする

  def show
    respond_to do |format|
      format.html { redirect_to profile_path } # prefix_pathでパスを生成できる
      format.json { render json: @book } # @bookをjsonで返す
    end
  end

  def show
    # @book = Book.find(params[:id]) この共通処理をフックでDRYにする
    render :show # これでapp/views/コントローラ名/アクション名.html.erbを探す
  end

  # renderは省略できる
  def show
  end

  def destroy
    # @book = Book.find(params[:id])
    @book.destroy
    respond_to do |format|
      format.html { redirect_to "/" }
      format.json { head :no_content }
    end
  end

  private
  
  def set_book
    @book = Book.find(params[:id])
  end
end
