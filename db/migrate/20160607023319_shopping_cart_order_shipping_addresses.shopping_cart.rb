# This migration comes from shopping_cart (originally 20160606185249)
class ShoppingCartOrderShippingAddresses < ActiveRecord::Migration
  def change
    create_table "shopping_cart_order_shipping_addresses", force: :cascade do |t|
      t.string   "first_name"
      t.string   "last_name"
      t.string   "street"
      t.string   "city"
      t.integer  "country_id"
      t.integer  "order_id"
      t.string   "zip"
      t.string   "phone"
    end
  end
end
