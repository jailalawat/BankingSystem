class AccountsController < ApplicationController
  # GET /accounts/1
  # GET /accounts/1.json
  def show
    @account = current_user.account
  end
end
