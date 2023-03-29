class FolloweesSleepsController < ApplicationController
  include JSONAPI::ActsAsResourceController

  def context
    { user_id: params[:user_id] }
  end
end
