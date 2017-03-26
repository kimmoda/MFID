class CommentsController < ApplicationController
    before_action :set_fit

    def create  
      @comment = @fit.comments.build(comment_params)
      @comment.user_id = current_user.id
    
      if @comment.save
        flash[:success] = "Saved"
        redirect_to :back
      else
        flash[:alert] = "Something went wrong."
        render root_path
      end
    end
    
    def destroy  
      @comment = @fit.comments.find(params[:id])
    
      @comment.destroy
      flash[:success] = "Removed"
      redirect_to root_path
    end  
    
    private
    
    def comment_params  
      params.require(:comment).permit(:content)
    end
    
    def set_fit
      @fit = Fit.find(params[:fit_id])
    end  
    
end
