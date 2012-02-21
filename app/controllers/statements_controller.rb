class StatementsController < ApplicationController
  before_filter :get_account
  
  def new
    @statement = @account.statements.new
  end
  
  def create
    StatementParser.parse(params[:statement][:file].tempfile)
    redirect_to account_path(@account), :flash => {
      :success => "Statement uploaded."
    }
  end
  
  private
  
  def get_account
    @account = current_user.accounts.find(params[:account_id])
  end
end
