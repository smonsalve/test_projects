class FrasesController < ApplicationController
  def index
    @frases = Frase.all
  end

  def show
    @frase = Frase.find(params[:id])
  end

  def new
    @frase = Frase.new
  end

  def create
    @frase = Frase.new(params[:frase])
    if @frase.save
      redirect_to @frase, :notice => "Successfully created frase."
    else
      render :action => 'new'
    end
  end

  def edit
    @frase = Frase.find(params[:id])
  end

  def update
    @frase = Frase.find(params[:id])
    if @frase.update_attributes(params[:frase])
      redirect_to @frase, :notice  => "Successfully updated frase."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @frase = Frase.find(params[:id])
    @frase.destroy
    redirect_to frases_url, :notice => "Successfully destroyed frase."
  end
end
