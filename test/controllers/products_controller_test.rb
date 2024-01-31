require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test 'render a list of products' do
    get products_path #Petición a la ruta

    assert_response :success #busca que la respuesta sea exito
    assert_select '.product', 2 #buscamos selectores que sean clases .product y contenga 2 (hemos creado 2 productos en las fixtures)
  end

  test 'render a detailed product page' do
    get product_path(products(:ps4)) #va a testear el producto PS4 procedente de las fixtures

    assert_response :success #respuesta satisfactoria.
    assert_select '.title', 'PS4 Fat'
    assert_select '.description', 'PS4 en buen estado'
    assert_select '.price', '150'
  end

  test 'render a new product form' do
    get new_product_path :success

    assert_select 'form'
  end

  test 'allow to create a new product' do
    post products_path, params: {
      product: {
        title: 'Nintendo 64',
        description: 'Le faltan los cables',
        price: 45
      }
    }

    assert_redirected_to products_path
    assert_equal flash[:notice], 'Producto creado correctamente'
  end

  test 'does not allow to create a new product with empty fields' do
    post products_path, params: {
      product: {
        title: '',
        description: 'Le faltan los cables',
        price: 45
      }
    }

    assert_response :unprocessable_entity
  end

  test 'render an edit product form' do
    get edit_product_path(products(:ps4)) #obtengo el producto PS4 de las fixtures

    assert_response :success #devuelve 200
    assert_select 'form' #etiqueta HTML form
  end

  test 'allow to update a product' do
    patch product_path(products(:ps4)), params: {
      product: {
        title: 'Playstation 4',
        description: 'Le faltan los cables',
        price: 200
      }
    }

    assert_redirected_to products_path
    assert_equal flash[:notice], 'Tu producto se ha actualizado'
  end

  test 'does not allow to update a product' do
    patch product_path(products(:ps4)), params: {
      product: {
        price: nil
      }
    }
    assert_response :unprocessable_entity
  end

  test 'can delete product' do
    assert_difference('Product.count', -1) do
      delete product_path(products(:ps4))
    end
    assert_redirected_to products_path
    assert_equal flash[:notice], 'Producto borrado correctamente'
  end
end
