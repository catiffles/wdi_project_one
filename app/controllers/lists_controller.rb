class ListsController < ApplicationController

  def show
    @list = List.find(params[:id])
    @phrase = Phrase.new(list: @list)
    @phrases = @list.phrases
  end

  def create
    @section = Section.find(params[:section_id])
    @list = @section.lists.new(list_params)

      if @list.save
        redirect_to section_path(@section)
      else
        render :new
      end
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    @list = List.find(params[:id])
    @section = @list.section
    if @list.update(list_params)
      redirect_to section_path(@section)
    else
      render :edit
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to :back
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end

end