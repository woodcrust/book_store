# This migration comes from shopping_cart (originally 20160606213152)
class ShoppingCartOrderItems < ActiveRecord::Migration
  def change
    create_table "shopping_cart_order_items", force: :cascade do |t|
      t.integer  "price"
      t.integer  "quantity"
      t.integer  "product_id"
      t.integer  "book_id"
      t.integer  "order_id"
    end
  end
end
