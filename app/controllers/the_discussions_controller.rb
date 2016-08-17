class TheDiscussionsController < ApplicationController
  before_filter :authorize

  def index
    if params[:id]
      num = params[:id]
    else
      num = 1
    end
    discussions = TheDiscussion.all.reverse
    to = (num.to_i * 10) - 1
    from = to - 9
    @discussions = discussions[from..to]
  end

  def create
    disc = TheDiscussion.new(disc_params)
    disc.topic = disc_params[:topic].squish
    if disc_params[:topic].squish.length > 10 && disc_params[:topic].squish.length < 100
      disc.save!
      render nothing: true
    else
      render nothing: true
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
