module PagesHelper
  def append_to_category_params(category_name)
    if params[:categories].class == Array
      params[:categories] << category_name
      categories = {categories: params[:categories]}
    else
      categories = {categories: [category_name]}
    end
      return "?" + categories.to_param
  end

  def remove_from_category_params(category_name)
    if params[:categories].class == Array
      params[:categories].delete(category_name)
      categories = {categories: params[:categories]}
      return "?" + categories.to_param
    end
  end
end
