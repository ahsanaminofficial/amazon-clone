class CommentController < ApplicationController


    def new
    end

    def create
        # byebug
        data = params.require(:comment).permit(:text, :product_id)
        # byebug
        @comment = current_user.comments.new({:text => params["comment"]["name"], :product_id => params["product_id"]})

        if @comment.save
            redirect_to product_path(params["product_id"])
        else
            redirect_to new_product_path
        end
    end


    def edit
    end

    def update
        temp = params.require(:comment).permit(:text)
        @comment = Comment.find(params[:id])
        
        if @comment.update(temp)
            redirect_to product_path(params[:product_id])
        else
            redirect_to edit_product_comment_path(params[:product_id], params[:id])
        end
    end

    def destroy
        @comment = Comment.find(params[:id])
        @comment.destroy()
        redirect_to product_path(params[:product_id])
    end

end
