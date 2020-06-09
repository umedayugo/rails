class BooksController < ApplicationController
    before_action :authenticate_user!
    before_action :correct_user, only: [:edit, :update]

	def new
        
    end
    def create
    	@book = Book.new(book_params)
    	@book.user_id = current_user.id
        @user = current_user
        @books = Book.all
        @book = current_user.books.build(book_params)
		if  @book.save
            flash[:notice] = "successfully"
		    redirect_to book_path(@book)
        else
            render :index
            


    end
    end
    def index
    	@book = Book.new
    	@books = Book.all
    	@user = current_user

    end
    def show
    	@book = Book.find(params[:id])
    	@booknew = Book.new
    	@user = @book.user
        @book_comment = BookComment.new
    end

    def edit
    	@book = Book.find(params[:id])
    end

    def destroy
    	book = Book.find(params[:id]) #データ(レコード)を1件取得
        book.destroy #データ（レコード）を削除
        redirect_to books_path #List一覧画面へリダイレクト
    end

    def update
    	@book = Book.find(params[:id])
    	if @book.update(book_params)
            flash[:notice] = "successfully"
    	    redirect_to @book
        else
    	    render 'edit'
        end
    end
    private
    def book_params
		params.require(:book).permit(:title, :body)
	end


    def correct_user
        @book = Book.find(params[:id])
        @user = @book.user
    unless @user.id == current_user.id
      redirect_to boo_path
    end
    end
end
