class UsersController < ApplicationController
	before_action :authenticate_user!, except: [:top, :about]

	


	def top
		@users = current_user
		@users = User.new
	end



	def create
		@user = User.new(User: params[:user])
		if @user.save
			flash[:notice] = "successfully"
		end
	end

	def show
		@book = Book.new
		@user = User.find(params[:id])
		@books = @user.books.all
		@user = current_user

	end

	
	def about

	end

	def index
		@book = Book.new
		@users = User.all
		@user = current_user
	end

	def edit
		@user = User.find(params[:id])
		unless current_user.id == @user.id
			redirect_to user_path(current_user)
			
		end
	end

	def update
       @user = User.find(params[:id])
    if @user.update(user_params)
            flash[:notice] = "successfully"
    	    redirect_to user_path(@user.id)
        else
    	    render 'edit'
        end
    end
    
    
    
	private 
	def user_params
	    params.require(:user).permit(:name, :profile_image, :introduction)
	end

	


	end
