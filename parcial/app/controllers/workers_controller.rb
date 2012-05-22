class WorkersController < ApplicationController
  def index
    @workers = Worker.all
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
