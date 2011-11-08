class EntriesController < ApplicationController
  def index
    @entries = search_entries
  end

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

  def edit
    @entry = Entry.find(params[:id])
  end

  def update
    @entry = Entry.find(params[:id])
    @entry.update_attributes(params[:entry])
    if @entry.save
      flash[:notice] = "Entry successfully updated"
      redirect_to entries_path
    else
      render :edit
    end
  end

  protected

  def search_entries
    unless params[:q].blank?
      Entry.search(params[:q])
    else
      []
    end
  end
end
