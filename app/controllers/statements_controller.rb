class StatementsController < ApplicationController
  before_filter :get_account
  
  def new
    @statement = @account.statements.new
  end
  
  def create
    @statement = @account.statements.new(params[:statement])
    if @statement.save
      redirect_to account_path(@account), :flash => {
        :success => "Statement uploaded."
      }
    else
      render 'new'
    end
  end
  
  private
  
  def get_account
    @account = current_user.accounts.find(params[:account_id])
  end
end
