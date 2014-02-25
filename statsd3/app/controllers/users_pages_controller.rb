class UsersPagesController < ApplicationController

  def index
    user_pages = User.all.map do |u|
     { id: u.id, api_key: u.api_key, pages: u.pages.select([:id, :title]) }
    end
    render json: user_pages.to_json
  end

end