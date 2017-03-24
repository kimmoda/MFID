class FitsController < ApplicationController

    def index
    end
    
    def new
        @fit = Fit.new
    end
end
