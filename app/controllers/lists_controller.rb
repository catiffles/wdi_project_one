class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy]

  def show
    @phrase = Phrase.new(list: @list)
    @phrases = @list.phrases.order("id ASC")
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
  end

  def update
    @section = @list.section
    if @list.update(list_params)
      redirect_to section_path(@section)
    else
      render :edit
    end
  end

  def destroy
    @list.destroy
    redirect_to :back
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name).merge(user_id: current_user.id)
  end

end
