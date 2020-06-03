module PagesHelper
  def append_to_category_params(category_name)
    params_categories = params[:categories].clone
    if params_categories.class == Array
      params_categories << category_name
      categories = {categories: params_categories}
    else
      categories = {categories: [category_name]}
    end
      return "?" + categories.to_param + "#filters"
  end

  def remove_from_category_params(category_name)
    params_categories = params[:categories].clone
    if params_categories.class == Array
      params_categories.delete(category_name)
      categories = {categories: params_categories}
      return "?" + categories.to_param + "#filters"
    end
  end
end
