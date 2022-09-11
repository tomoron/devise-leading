class TweetsController < ApplicationController
  before_action :set_tweet, only: %i[ show edit update destroy ]


  # GET /tweets or /tweets.json
  def index
    @tweets = Tweet.all
    respond_with @tweets
  end

  # GET /tweets/1 or /tweets/1.json
  def show
  end

  # GET /tweets/new
  def new
    @tweet = Tweet.new
    respond_with @tweet
  end

  # GET /tweets/1/edit
  def edit
    respond_with @tweet
  end

  # POST /tweets or /tweets.json
  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.save
    respond_with @tweet, location: tweets_url
  end

  # PATCH/PUT /tweets/1 or /tweets/1.json
  def update
    @tweet.update(tweet_params)
    respond_with @tweet, location: tweets_url
  end

  # DELETE /tweets/1 or /tweets/1.json
  def destroy
    @tweet.destroy

    respond_with @tweet, location: tweets_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tweet
      @tweet = Tweet.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tweet_params
      params.require(:tweet).permit(:content).merge(user_id: 1)
    end
end
