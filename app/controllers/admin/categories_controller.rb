class Admin::CategoriesController < Admin::AdminBaseController
  layout "admin"
  before_action :categories, only: %i(index new edit update)
  before_action :category, only: %i(show edit update destroy)

  def index; end

  def new
    @category = Category.new
  end

  def create
    category = Category.new category_create_params
    category.parent = Category.find_by! id: category_create_params[:parent_id] if category_create_params[:parent_id].present?
    if category.save
      redirect_to admin_categories_path
    else
      render :new
    end
  end

  def edit; end

  def update
    @category.assign_attributes name: category_update_params[:name],
                                parent: Category.find_by!(id: category_create_params[:parent_id])
    if category.save
      redirect_to admin_categories_path
    else
      render :edit
    end
  end

  def show; end

  def destroy
    @category.destroy
    redirect_to admin_categories_path
  end

  private
  def categories
    @categories ||= Category.all
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
