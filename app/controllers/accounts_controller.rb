class AccountsController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @accounts = Account.by_user(current_user).all
  end
  
  def show
    @account = Account.by_user(current_user).find_by_id(params[:id])
  end
  
  def new
    @account = Account.by_user(current_user).new
  end
  
  def create
    @account = Account.by_user(current_user).new(params[:account])
    if @account.save
      redirect_to root_path, :flash => { :success => "Account created!" }
    else
      render 'new'
    end
  end
end
