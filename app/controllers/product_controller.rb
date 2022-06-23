class ProductController < ApplicationController
    def index
        @products = Product.where.not(user_id: current_user)
    end

    def new
        #renders new.html.erb
    end

    def show
        @product = Product.find(params[:id])
    end

    def edit
        @product = Product.find(params[:id])
    end


    def update
        # byebug
        temp = params.require(:product).permit(:name, :details)
        @product = Product.find(params[:id])
        
        if @product.update(temp)
            redirect_to product_path(@product)
        else
            redirect_to edit_product_path(@product)
        end
    end

    def create
        data = params.require(:product).permit(:name, :details)
        @product = current_user.products.new(data)

        if @product.save
            redirect_to product_own_path
        else
            redirect_to new_product_path
        end

    end

    def ownproducts
        @products = current_user.products
    end


    def destroy
        @product = Product.find(params[:id])
        @product.destroy()
        redirect_to product_own_path
    end


end
