class GamesController < ApplicationController
  def new
    @letters = ('A'..'Z').to_a.sample(10)
  end

  def score
    @answer = params[:answer]
    @url = "https://wagon-dictionary.herokuapp.com/#{@answer}"
    @chars = @answer.chars
    get_result(@url)
  end

  def check_letters(chars)
    chars.each do |char|
      @letters.include? "#{char}"
    end
  end

  def get_result(url)
    serialized = open(url).read
    parsed = JSON.parse(serialized)
    parsed.symbolize_keys!
    @score = parsed[:length]
    @word = parsed[:word]
    @found = parsed[:found]
    @welcome = parsed[:message]
  end
end
