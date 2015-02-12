class SectionsController < ApplicationController
  before_action :set_section, only: [:show, :edit, :update, :destroy]

  def show
    @topic = @section.topic
    @list = List.new(section_id: @section)
    @section = Section.find(params[:id])
    @lists = @section.lists.order("id ASC")
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @section = @topic.sections.new(section_params)

      if @section.save
        redirect_to topic_path(@topic)
      else
        render :new
      end
  end

  def edit
  end

  def update
    if @section.update_attributes(section_params)
      @topic = @section.topic
      redirect_to topic_path(@topic)
    else
      render :edit
    end
  end

  def destroy
    @section.destroy
    @topic = @section.topic
    redirect_to topic_path(@topic)
  end

  private

  def set_section
    @section = Section.find(params[:id])
  end

  def section_params
    params.require(:section).permit(:name).merge(user_id: current_user.id)
  end

end
