class ProductsController < ApplicationController
    def index
        @products = Product.all 
        p @products
    end
    
    def show
        @product = Product.find(params[:id])
    end

    def new
        @product = Product.new
    end

    def create
        @product = Product.new(product_params) #Con product_params capturamos la request

        if @product.save
            redirect_to products_path
        else
            render :new
        end

    end

    private

    def product_params #capturo la request.
        params.require(:product).permit(:title, :description, :price) #recoge de los parámetros un objeto de tipo product
    end

end
