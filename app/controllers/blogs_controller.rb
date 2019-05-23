class BlogsController < ApplicationController

  def index

    @list_of_blogs = Blog.all
    if user_signed_in?
      redirect_to :controller => 'blogs' , :action => 'Dashboard'
    end


  end





def Dashboard

  id=params[:id]
  @result_blog = Blog.where(user_id:current_user.id)
  puts @result_blog
end



  def show

    id=params[:id]
    @result_blog = Blog.find(id)

  end

  def new

    @blog = Blog.new

  end

  def create

    @blog = Blog.new(
        params.require(:blog).permit(:title, :description, :author, :user_id)
    )
    @blog.user_id = current_user.id
    result = @blog.save()
    if result
      redirect_to :controller => 'blogs' , :action => 'index'
    else
      puts result
      puts "Not saved"
    end

  end

  def destroy
    id = params[:id]

    Blog.destroy(id)
    redirect_to :controller => 'blogs' , :action => 'index'
  end

  def edit
    @blog = Blog.find(params[:id])

  end

  def update
    @blog = Blog.find(params[:id])
    if @blog.update(params.require(:blog).permit(:title, :description, :author, :user_id))
    redirect_to :controller => 'blogs' , :action => 'index'
  end
  end
  end

