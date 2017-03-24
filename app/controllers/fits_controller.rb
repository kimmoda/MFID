class FitsController < ApplicationController
    before_action :set_fit, only: [:show, :edit, :update, :destroy]

    def index
        @fits = Fit.all
    end
    
    def show
    end
    
    def new
        @fit = Fit.new
    end

    def create
        if @fit = Fit.create(fit_params)
            flash[:success] = "Your fit has been created!"
            redirect_to fits_path
        else
            flash.now[:alert] = "Error adding fit! Please check fields."
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
    
    def fit_params
        params.require(:fit).permit(:image, :caption)
    end
    
    def set_fit
        @fit = Fit.find(params[:id])
    end
end
