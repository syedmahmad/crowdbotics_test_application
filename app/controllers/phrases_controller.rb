class PhrasesController < ApplicationController
  def index

  end

  def fetch_all_phrases
    @phrases = Phrase.where(visible: true)
    phrases_arr = []
    @phrases.each do |phrase|
      phrases_arr.push "sample phrase number #{phrase.id}"; 
    end
    data = {phrases: phrases_arr}

    render json: data
  end

  def fetch_phrases
    @phrases = Phrase.where(visible: false)
    phrase = @phrases[rand(@phrases.length)]
    phrases_left = false
    message = "No sample phrase"
    if phrase
      phrases_left = true
      message = "sample phrase number #{phrase.id}" 
      phrase.update_attributes(visible: true)
      phrase.save
    end
    render json: {phrase: message, hasPhrase: phrases_left}
  end

  def clear_phrases
    Phrase.all.update_all(visible: false)
    render json: true
  end
end
