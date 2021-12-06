class Admin::CategoriesController < Admin::AdminBaseController
  layout "admin"
  before_action :categories, only: %i(index)
  before_action :category, only: %i(show update destroy)

  def index
    # index of categories page
  end

  def create
    category = Category.new category_create_params
    redirect_to :index if category.save!
  end

  def update
    @category.assign_attributes category_update_params
    redirect_to :index if @category.save!
  end

  def show
  end

  def destroy
    @category.destroy
    redirect_to :index
  end

  private
  def categories
    @category ||= Category.roots
  end

  def category_create_params
    params.require(:category).permit(Category::ATTRIBUTES_CREATE)
  end

  def category_update_params
    params.require(:category).permit(Category::ATTRIBUTES_UPDATE)
  end

  def category
    @category ||= Category.find_by! id: params[:id]
  end
end
