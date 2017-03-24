class FitsController < ApplicationController

    def index
        @fits = Fit.all
    end
    
    def show
        @fit = Fit.find(params[:id])
    end
    
    def new
        @fit = Fit.new
    end

    def create
        @fit = Fit.create(fit_params)
        redirect_to fits_path
    end

    def edit
        @fit = Fit.find(params[:id])
    end

    def update
        @fit = Fit.find(params[:id])
        @fit.update(fit_params)
        redirect_to(fit_path(@fit))
    end
    
    def destroy
        @fit = Fit.find(params[:id])
        @fit.destroy
        redirect_to fits_path
    end

    private
    
    def fit_params
        params.require(:fit).permit(:image, :caption)
    end

end
