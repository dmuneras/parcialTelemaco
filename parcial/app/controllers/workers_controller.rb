class WorkersController < ApplicationController
  def index
    @workers = Worker.all
  end

  def show
    @worker = Worker.find(params[:id])
  end

  def new
    @worker = Worker.new
  end

  def create
    @worker = Worker.new(params[:worker])
    if @worker.save
      redirect_to @worker, :notice => "Successfully created worker."
    else
      render :action => 'new'
    end
  end

  def edit
    @worker = Worker.find(params[:id])
  end

  def update
    @worker = Worker.find(params[:id])
    if @worker.update_attributes(params[:worker])
      redirect_to @worker, :notice  => "Successfully updated worker."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @worker = Worker.find(params[:id])
    @worker.destroy
    redirect_to workers_url, :notice => "Successfully destroyed worker."
  end
  
  def search
    respond_to do |format|
    format.js{
      response = Worker.search(params[:word])
      @result = response[:info]
      @server = response[:server]
    }
  end
  end
end
