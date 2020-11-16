class GamesController < ApplicationController
  def new
    @letters = ('A'..'Z').to_a.sample(10)
  end

  def score
    @answer = params[:answer]
    url = "https://wagon-dictionary.herokuapp.com/#{@answer}"
    @serialized = open(url).read
    @parsed = JSON.parse(@serialized)
    @parsed.symbolize_keys!
  end
end
