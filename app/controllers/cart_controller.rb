class CartController < ApplicationController
    def index
        if current_user.cart.blank?
            @cart = Cart.new(user_id: current_user.id)
            @cart.save!
        end

        entries = CartProduct.where(cart_id: current_user.cart)
        @products = []
        entries.each do |entry|
            @products.push({name: Product.find_by_id(entry.product_id).name, id:entry.product_id, entry_id: entry.id})
        end


    end

    def add
        @entry = CartProduct.new(cart_id: current_user.cart.id, product_id: params[:product_id])
        if @entry.save
            redirect_to cart_path
        else
            redirect_to product
        end
      
    end

    def delete
        entries = CartProduct.find_by_id(params[:id])
        entries.destroy
        redirect_to cart_path

    end

end
