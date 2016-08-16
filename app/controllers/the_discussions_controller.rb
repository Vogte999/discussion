class TheDiscussionsController < ApplicationController
  before_filter :authorize

  def index
    discussions = TheDiscussion.all.reverse
    to = (params[:id].to_i * 10) - 1
    from = to - 9
    @discussions = discussions[from..to]
  end

  def new
  end

  def create
    disc = TheDiscussion.new(disc_params)
    if disc_params[:topic].squish.length > 10 && disc_params[:topic].squish.length < 100
      disc.save!
      redirect_to '/the_discussions'
    else
      redirect_to '/the_discussions/new'
    end
  end

  def show
    @discussion = TheDiscussion.find(params[:id])
    session[:discid] = params[:id]
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private def disc_params
    params.require(:the_discussion).permit(:topic)
  end

end
