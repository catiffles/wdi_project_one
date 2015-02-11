class TopicsController < ApplicationController
  before_filter :authenticate_user!, only: [:create, :update, :destroy]

  def index
    @topics = Topic.all.order("name ASC")
  end

  def new
    @topic = Topic.new
  end

  def show
    @topic = Topic.find(params[:id])
    @section = Section.new(topic_id: @topic)
    @sections = @topic.sections.order("id ASC")
  end

  def create
    @topic = Topic.new(topic_params)
    @topic.user = current_user

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
    @topic.user = current_user

    if @topic.update_attributes(topic_params)
      flash[:success] = 'Topic successfully updated'
      redirect_to topics_path
    else
      render :edit
    end
  end

  def destroy
    @topic = Topic.find(params[:id])
    @topic.user = current_user
    @topic.destroy
    flash[:success] = 'Topic successfully deleted'
    redirect_to topics_path
  end

  private

  def topic_params
    params.require(:topic).permit(:name)
  end
end
