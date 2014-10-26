#encoding:utf-8
class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  @sub
  # GET /categories
  # GET /categories.json
  def index
    @categories = Category.all
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
    #session[:errors] = nil
    @sub_categories = SubCategory.where(CategoryId: @category.id)
    #puts @sub_category
    @sub_category = SubCategory.new(:CategoryId => @category.id, :CategoryName => @category.Name)
    puts session[:errors]
    #@sub_category.errors = session[:errors]
  end

  # GET /categories/new
  def new
    @category = Category.new
  end

  # GET /categories/1/edit
  def edit
  end


  # POST /sub_categories
  # POST /sub_categories.json
  def create_sub
    @sub_category = SubCategory.new(sub_category_params)
    @category = Category.find(@sub_category.CategoryId)
    @sub_categories = SubCategory.where(CategoryId: @category.id)
    respond_to do |format|
      if @sub_category.save
        format.html { redirect_to @category, notice: 'Sub category was successfully created.' }
        format.json { render :show, status: :created, location: @sub_category }
      else
        format.html { render :show, notice: '<div class="alert alert-error">添加失败</div>' }
        format.json { render json: @sub_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /categories
  # POST /categories.json
  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to @category, notice: 'Category was successfully created.' }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to @category, notice: 'Category was successfully updated.' }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_url, notice: 'Category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_category
    @category = Category.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def category_params
    params.require(:category).permit(:Name, :Type, :Parentid)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def sub_category_params
    params.require(:sub_category).permit(:CategoryId, :CategoryName, :Name)
  end
end
