class ListsController < ApplicationController
  def new
   @list = List.new
  end

# 以下を追加
  def create
    # １.&2. データを受け取り新規登録するためのインスタンス作成
    list = List.new(Book_params)
    # 3. データをデータベースに保存するためのsaveメソッド実行
    list.save
    # 4. トップ画面へリダイレクト
    redirect_to '/top'
  end

  def index
   @lists = List.all
  end

  def show
  @list = List.find(params[:id])
  end

  def edit
  end

  private
  # ストロングパラメータ
  def Book_params
    params.require(:book).permit(:title, :body)
  end
end
