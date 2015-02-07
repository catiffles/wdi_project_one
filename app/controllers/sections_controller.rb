class SectionsController < ApplicationController

  def show
    @section = Section.find(params[:id])
    @topic = @section.topic
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
    @section = Section.find(params[:id])
  end

  def update
    @section = Section.find(params[:id])
    if @section.update(section_params)
      @topic = @section.topic
      redirect_to topic_path(@topic)
    else
      render :edit
    end
  end

  def destroy
    @section = Section.find(params[:id])
    @section.destroy
    @topic = @section.topic
    redirect_to topic_path(@topic)
  end

  private

  def section_params
    params.require(:section).permit(:name)
  end

end