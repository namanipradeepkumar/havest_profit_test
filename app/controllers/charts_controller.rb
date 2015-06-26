class ChartsController < ApplicationController
  def index
    start_date = '2014-09-01' #(Time.now - 1.year).to_formatted_s(:number)
    end_date = Time.now.to_formatted_s(:number)

    symbol = "ZCz15"

    render json: RestClient.get("http://ondemand.websol.barchart.com/getHistory.json?apikey=#{ENV["BARCHART_API_KEY"]}&symbol=#{symbol}&type=daily&startDate=#{start_date}&endDate=#{end_date}").to_s
  end
end
