class WorkersController < ApplicationController

  def index
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
