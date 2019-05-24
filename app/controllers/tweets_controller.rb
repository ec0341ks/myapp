class TweetsController < ApplicationController
  before_action :move_to_index, except: :index
  def index
    @tweets = Tweet.order("created_at DESC").page(params[:page]).per(4)
  end

  def new
  end

  def create
    Tweet.create(country: tweet_params[:country], city: tweet_params[:city], image: tweet_params[:image], text: tweet_params[:text], user_id: current_user.id)
  end
  
  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy if tweet.user_id == current_user.id
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end
  
  def update
    tweet = Tweet.find(params[:id])
    if tweet.user_id == current_user.id
      tweet.update(tweet_params)
    end
  end
  
  private
  def tweet_params
    params.permit(:country, :city, :image, :text)
  end
  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end