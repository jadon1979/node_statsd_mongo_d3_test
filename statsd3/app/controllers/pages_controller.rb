class PagesController < ApplicationController
  before_action :set_user
  before_action :set_page, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def show
  end

  def new
    @page = @user.pages.new
  end

  def edit
  end

  def create
    @page = @user.pages.new(page_params)    
    flash[:notice] = 'Page was successfully created.' if @page.save
    respond_with @user, @page
  end

  def update
    flash[:notice] = 'Page was successfully updated.' if @page.update(page_params)
    respond_with @user, @page
  end

  def destroy
    flash[:notice] = 'Page was successfully destroyed.' if @page.destroy
    respond_with @user
  end

  private
    
    def set_user
      @user = User.find(params[:user_id])
    end

    def set_page
      @page = @user.pages.find(params[:id])
    end

    def page_params
      params.require(:page).permit(:title, :slug, :body, :user_id)
    end
end
