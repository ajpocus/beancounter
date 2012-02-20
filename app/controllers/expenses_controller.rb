class ExpensesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :get_account
  
  def index
    @expenses = @account.expenses.all
  end
  
  def new
    @expense = @account.expenses.new
  end
  
  def create
    @expense = @account.expenses.new(params[:expense])
    if @expense.save
      redirect_to account_path(@account), :flash => {
        :success => "Expense created"
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
