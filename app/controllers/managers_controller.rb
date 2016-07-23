class ManagersController < ApplicationController
  before_filter :authenticate_user!

  def dashboard
=begin
    @business_news = BusinessNew.all_bloggers
    @notifications = Notification.where(user_id: current_user.id)
    @sales = current_user.sales
    @best_products = product_linked.limit_six
    @featured_products = Product.product_highlight_sale
    render layout: 'dashboard_blogger'
=end
  end

end