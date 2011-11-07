class EntriesController < ApplicationController
  def new
    @entry = Entry.new
  end
  def create
    @entry = Entry.new(params[:entry])
    if @entry.save
      flash[:notice] = "Entry successfully created"
      redirect_to entries_path 
    else
      render :new
    end
  end
end
