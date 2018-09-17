class MainController < ApplicationController
  def home
  end

  def about
  end

  def get_exchange_rate
    from_currency = params[:from]
    to_currency = params[:to]
    pair = "#{from_currency}_#{to_currency}"
    amount_to_convert = params[:amount].to_f

    rate = CurrencyService.get_exchange_rate_for(pair)

    final_amount = rate * amount_to_convert

    render json: final_amount, status: 200
  end
end
