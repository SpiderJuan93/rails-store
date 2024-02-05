class ProductsController < ApplicationController
    def index
        @products = Product.all.with_attached_photo
    end
    
    def show
        product
    end

    def new
        @product = Product.new
    end

    def create
        @product = Product.new(product_params) #Con product_params capturamos la request

        if @product.save
            redirect_to products_path, notice: t('.created') #redirigimos al index products
        else
            render :new, status: :unprocessable_entity #Para devolver el status 422 y que muestre al usuario los valores de validación del modelo.
        end

    end

    def edit
        product
    end

    def update
        if product.update(product_params)
            redirect_to products_path, notice: t('.updated')
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        product.destroy
        redirect_to products_path, notice: t('.deleted'), status: :see_other
    end

    private

    def product_params #capturo la request.
        params.require(:product).permit(:title, :description, :price, :photo) #recoge de los parámetros un objeto de tipo product
    end

    def product
        @product = Product.find(params[:id])
    end
end
