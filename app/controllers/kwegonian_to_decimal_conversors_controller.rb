class KwegonianToDecimalConversorsController < ApplicationController

  def index
      @conversor = KwegonianToDecimalConversor.new
  end

  def create    
    @conversor = KwegonianToDecimalConversor.new
    @conversor.entrada_kwegonian = conversor_params[:entrada_kwegonian]
    
    kwegonian_to_roman = @conversor.kwegonian_to_roman conversor_params[:entrada_kwegonian]
    roman_to_decimal = @conversor.roman_to_decimal kwegonian_to_roman

    @conversor.saida_decimal = roman_to_decimal
    
    respond_to do |format|
      format.html { render action: 'show' }
    end
  end

  def show

  end

  def update
  end

  def destroy
  end

  private
    def conversor_params
      params.require(:kwegonian_to_decimal_conversor).permit(:entrada_kwegonian)
    end
end
