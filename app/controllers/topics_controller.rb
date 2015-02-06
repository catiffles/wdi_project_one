class TopicsController < ApplicationController
  def index
    @topics = Topic.all
  end

  def new
    @topic = Topic.new
  end

  def show
    @topic = Topic.find(params[:id])
  end

  def create
    @topic = Topic.new(topic_params)

    if @topic.save
      flash[:success] = 'Topic successfully created'
      redirect_to topics_path
    else
      render :new
    end
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def update
    @topic = Topic.find(params[:id])

    if @topic.update_attributes(topic_params)
      flash[:success] = 'Topic successfully updated'
      redirect_to topics_path
    else
      render :edit
    end
  end

  private

  def topic_params
    params.require(:topic).permit(:name)
  end
end