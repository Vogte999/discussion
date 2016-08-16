class PostsController < ApplicationController
  before_filter :authorize

  def create
    post = Post.new(post_params)
    if post_params[:text].squish.length > 10
      post.the_discussion = TheDiscussion.find(session[:discid])
      post.user = User.find(session[:id])
      post.save!
      redirect_to "/the_discussions/#{session[:discid]}"
    else
      redirect_to '/posts/new'
    end
  end

  private def post_params
    params.require(:post).permit(:text)
  end

end
