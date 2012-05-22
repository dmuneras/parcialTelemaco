class DocumentsController < ApplicationController
  
  def search_response
    respond_to do |format|
    format.json{
      logger.info "======> palabra buscada = #{params[:word]}"
      result = Document.search_response params[:word]
      info = {:info => result}
        render json: info
    }
    end
    
  end
end
