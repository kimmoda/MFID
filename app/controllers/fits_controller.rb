class FitsController < ApplicationController

    def index
        @fits = Fit.all
    end
    
    def new
        @fit = Fit.new
    end

    def create
        @fit = Fit.create(fit_params)
        redirect_to fits_path
    end

    private
    
    def fit_params
        params.require(:fit).permit(:image, :caption)
    end

end
