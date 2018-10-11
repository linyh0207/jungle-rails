class Admin::CategoriesController < ApplicationController

  http_basic_authenticate_with :name => ENV['HTTP_BASIC_AUTHENTICATE_WITH_NAME'], :password => ENV['HTTP_BASIC_AUTHENTICATE_WITH_PASSWORD'] 


  def index #public instance method
    @categories = Category.all
  end

  def new #get call
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to [:admin, :categories], notice: 'Category created!'
    else
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit(
      :name
    )
  end
end
