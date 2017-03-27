class FitsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_fit, only: [:show, :edit, :update, :destroy]
    before_action :owned_fit, only: [:edit, :update, :destroy]

    def index
        @fits = Fit.all.order('created_at DESC')
    end
    
    def show
    end
    
    def new
        @fit = current_user.fits.build
    end

    def create
        @fit = current_user.fits.build(fit_params)
        
        if @fit.save
            flash[:success] = "Your fit has been created!"
            redirect_to fits_path
        else
            flash[:alert] = "Error adding fit! Please check fields."
            render :new
        end
    end

    def edit
    end

    def update
        if @fit.update(fit_params)
            flash[:success] = "Fit updated."
            redirect_to(fit_path(@fit))
        else
            flash.now[:alert] = "Error editing fit! Please check fields."
            render :edit
        end
    end
    
    def destroy
        @fit.destroy
        flash[:success] = "Fit removed."
        redirect_to fits_path
    end

    private
    
    def owned_fit
        unless current_user == @fit.user
            flash[:alert] = "That fit doesn't belong to you!"
            redirect_to root_path
        end
    end
    
    def set_fit
        @fit = Fit.find(params[:id])
    end
    
    def fit_params
        params.require(:fit).permit(:image, :caption)
    end
    
end
