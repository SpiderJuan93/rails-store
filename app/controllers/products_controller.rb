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
            redirect_to products_path, notice: 'Producto creado correctamente' #redirigimos al index products
        else
            render :new, status: :unprocessable_entity #Para devolver el status 422 y que muestre al usuario los valores de validación del modelo.
        end

    end

    def edit
        @product = Product.find(params[:id]) #Lee el parametro desde la URL
    end

    def update
        @product = Product.find(params[:id]) #Lee el parametro desde la URL

        if @product.update(product_params)
            redirect_to products_path, notice: 'Tu producto se ha actualizado'
        else
            render :edit, status: :unprocessable_entity
        end
    end

    private

    def product_params #capturo la request.
        params.require(:product).permit(:title, :description, :price) #recoge de los parámetros un objeto de tipo product
    end

end
