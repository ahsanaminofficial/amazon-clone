class CartController < ApplicationController
    skip_before_action :verify_authenticity_token, :only => [:update]
    def index
        if current_user.cart.blank?
            @cart = Cart.new(user_id: current_user.id)
            @cart.save!
        end

        entries = CartProduct.where(cart_id: current_user.cart)
        @products = []
        entries.each do |entry|
            if current_user.id != Product.find_by_id(entry.product_id).user_id
                @products.push({name: Product.find_by_id(entry.product_id).name, id:entry.product_id, entry_id: entry.id, quantity: CartProduct.find_by(cart_id: current_user.cart, product_id: entry.product_id).quantity})
            end
        end


    end

    def add
        if current_user.cart.blank?
            @cart = Cart.new(user_id: current_user)
            @cart.save!
        end

        if (CartProduct.find_by(cart_id: current_user.cart, product_id: params[:product_id])).blank?
            @entry = CartProduct.new(cart_id: current_user.cart.id, product_id: params[:product_id], quantity: 1)
            if @entry.save
                redirect_to cart_path
            else
                redirect_to product
            end
        else
            @existing_entry = CartProduct.find_by(cart_id: current_user.cart, product_id: params[:product_id])
            @existing_entry.update(quantity: (@existing_entry.quantity + 1))
            redirect_to cart_path
        end
      
    end

    def delete
        entries = CartProduct.find_by_id(params[:id])
        if entries.quantity == 1
            entries.destroy
        else
            entries.update(quantity: entries.quantity - 1)
        end

        redirect_to cart_path

    end

    def update
        # byebug
        entries = CartProduct.find_by_id(params[:id])
        if params[:quantity] == 0
            entries.destroy
        else
            entries.update(quantity: params["quantity"])
        end


        redirect_to cart_path

    end

end
