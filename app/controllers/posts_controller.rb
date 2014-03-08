class PostsController < ApplicationController
  
http_basic_authenticate_with name: "raghu", password: "drr", except: [:index, :show]

before_action :authenticate_user!, only: [:create, :update, :new, :destroy, :edit]

  def index
	@posts = Post.all
  end

  def search
	 @posts = Post.where("title LIKE ? or content LIKE ?", "%#{params[:q]}%", "%#{params[:q]}%" )
	 render 'index'
  end

  def show
	@post = Post.find(params[:id])
  end

  def new
	@post = Post.new
  end

  def edit
	  @post = Post.find(params[:id])
  end
  
  def create
	#@post = Post.create(params[:post])
	@post = Post.new(post_params)
	if @post.save
		redirect_to :action => "index"
	else
		render "new"
	end
 end
	 
  def update
  @post = Post.find(params[:id])
 
  if @post.update(post_params)
    redirect_to @post
  else
    render 'edit'
  end
end

def destroy
	@post = Post.find(params[:id])
  @post.destroy
 
  redirect_to posts_path
end


 
  private
  
  def post_params
    params.require(:post).permit(:title, :content)
  end
  
  
  
  
end
