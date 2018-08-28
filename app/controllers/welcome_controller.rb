class WelcomeController < ApplicationController
  def index
  	@bank = Bank.first
  end
end
