class MainController < ApplicationController
  def home
  end

  def about
  end

  def get_exchange_rate
    from_currency = params[:startingCurrency]
    to_currency = params[:endingCurrency]
    pair = "#{from_currency}_#{to_currency}"
    amount_to_convert = params[:startingAmount].to_f

    rate = CurrencyService.get_exchange_rate_for(pair)

    final_amount = rate * amount_to_convert
    puts "Final Amount: #{final_amount}"

    respond_to do |format|
      format.js { render json: final_amount, status: 200 }
    end
  end
end
