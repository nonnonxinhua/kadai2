class BooksController < ApplicationController
# 以下を追加
  def create
    # １.&2. データを受け取り新規登録するためのインスタンス作成
    book = Book.new(book_params)
    # 3. データをデータベースに保存するためのsaveメソッド実行
    book.save
    # 4. トップ画面へリダイレクト
    # TODO: bookのshow pageに移動したい
    redirect_to book_path(book.id), notice: "Book was successfully created."

  end

  def index
    @book = Book.new
    @books = Book.all
  end

  def show
     @book = Book.find(params[:id])
  end

  def edit
  @book = Book.find(params[:id])
  end

  def destroy
    book = Book.find(params[:id])  # データ（レコード）を1件取得
    book.destroy  # データ（レコード）を削除
    redirect_to '/books'  # 投稿一覧画面へリダイレクト
  end
    #   def new
    #   @list = Book.new
    #   end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id), notice: "Book was successfully updated."
  end

  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
