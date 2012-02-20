class TagsController < ApplicationController
  def index
    @tags = current_user.owned_tags
  end
end
