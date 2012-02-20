class TransactionsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :get_account
  
  accepts_nested_attributes_for :tags
  
  def index
    @transactions = @account.transactions.all
  end
  
  def new
    @transaction = @account.transactions.new
  end

  private
  
  def get_account
    @account = Account.by_user(current_user).find(params[:account_id])
  end
end
