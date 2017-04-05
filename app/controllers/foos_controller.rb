class FoosController < ApplicationController
  def index
    sleep 1
    @random_number = Random.rand(1000000)
  end
end
