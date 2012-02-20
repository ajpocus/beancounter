class IncomesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :get_account

  def index
    @incomes = @account.incomes.all
  end

  def new
    @income = @account.incomes.new
  end

  def create
    @income = @account.incomes.new(params[:income])
    if @income.save
      redirect_to account_path(@account), :flash => {
        :success => "Income created"
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
