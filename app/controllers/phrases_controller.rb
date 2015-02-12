class PhrasesController < ApplicationController

  def show
    @phrase = Phrase.find(params[:id])
  end

  def create
    @list = List.find(params[:list_id])
    @phrase = @list.phrases.new(phrase_params)

      if @list.save
        redirect_to list_path(@list)
      else
        flash[:notice] = "Invalid without an English phrase"
        redirect_to phrase_path(@phrase)
      end
  end

  def edit
    @phrase = Phrase.find(params[:id])
  end

  def update
    @phrase = Phrase.find(params[:id])
    if @phrase.update_attributes(phrase_params)
      @list = @phrase.list
      redirect_to list_path(@list)
    else
      render :edit
    end
  end

  def destroy
    @phrase = Phrase.find(params[:id])
    @phrase.destroy
    @list = @phrase.list
    redirect_to list_path(@list)
  end

  private

  def phrase_params
    params.require(:phrase).permit(:english, :traditional, :simplified, :pinyin).merge(user_id: current_user.id)
  end

end
