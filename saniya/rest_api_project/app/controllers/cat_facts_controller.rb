
class CatFactsController < ApplicationController
  def random_fact
    @fact = CatFacts::Client.new.random_facts['text']
    render json: { fact: @fact }
  end
end

