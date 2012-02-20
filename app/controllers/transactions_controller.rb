class TransactionsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :get_account
    
  def index
    @transactions = @account.transactions.all
  end
  
  def new
    @transaction = @account.transactions.new
  end

  def create
    @transaction = @account.transactions.new(params[:transaction])
    if @transaction.save
      redirect_to account_path(@account), :flash => {
        :success => "Transaction created"
      }
    else
      render 'new'
    end
  end

  private
  
  def get_account
    @account = Account.by_user(current_user).find(params[:account_id])
  end
end
