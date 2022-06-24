class CommentController < ApplicationController


    def new
    end

    def create
        data = params.require(:comment).permit(:text)
        @product = current_user.products.new(:text: data[:text], prod_id: )

        if @product.save
            redirect_to product_own_path
        else
            redirect_to new_product_path
        end
    end
end
