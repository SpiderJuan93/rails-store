class ProductsController < ApplicationController
    def index
        @products = Product.all 
        p @products
    end
    
    def show
        @product = Product.find(params[:id])
    end
end
