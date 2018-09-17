class CurrencyService
  CURRENCY_API_URL = 'https://free.currencyconverterapi.com/api/v6/convert?compact=ultra&q='
  # Fetches currency pairing exchange rate from cache
  # or hits API endpoint if expired.
  # A currency pair should be passed in the following format: CUR1_CUR2
  def self.get_exchange_rate_for(pair)
    Rails.cache.fetch(pair, expires_in: 1.minute) do
      pair_url = CURRENCY_API_URL + pair
      puts '--------------'
      puts 'Hitting API'
      response = Excon.get(pair_url)
      puts '--------------'
      value = JSON.parse(response.body)
      value[pair].to_f
    end
  end
end