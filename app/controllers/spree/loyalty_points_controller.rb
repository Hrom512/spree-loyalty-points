class Spree::LoyaltyPointsController < Spree::StoreController

  def index
    @title = Spree.t(:loyalty_points)
    @loyalty_points_transactions = spree_current_user.loyalty_points_transactions.includes(:source).order(updated_at: :desc).
      page(params[:page]).
      per(params[:per_page] || Spree::Config[:orders_per_page])
  end

end
