class PagesController < ApplicationController
  before_action :set_page, only: [:show, :edit, :update, :destroy]

  # GET /pages/1
  def show
  end

  # GET /pages/new
  def new
    @user = User.find(params[:user_id])
    @page = @user.pages.new
  end

  # GET /pages/1/edit
  def edit
  end

  # POST /pages
  def create
    @user = User.find(params[:user_id])
    @page = @user.pages.new(page_params)
    if @page.save
      redirect_to user_page_path(@user, @page), notice: 'Page was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /pages/1
  def update
    if @page.update(page_params)
      redirect_to user_page_path(@user, @page), notice: 'Page was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /pages/1
  def destroy
    @page.destroy
    redirect_to user_path(@user), notice: 'Page was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page
      @user = User.find(params[:user_id])
      @page = Page.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def page_params
      params.require(:page).permit(:title, :slug, :body, :user_id)
    end
end
