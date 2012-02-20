class TagsController < ApplicationController
  def index
    @tags = current_user.owned_tags
  end
  
  def show
    @tag = current_user.owned_tags.find(params[:id])
  end
  
  def total
    @tag = current_user.owned_tags.find(params[:id])
    @total = Transaction.tagged_with(@tag.name).sum(:amount)
  end
  
  def frequency
    @tag = current_user.owned_tags.find(params[:id])
    transactions = Transaction.tagged_with(@tag.name).map(&:date)
  end
end
