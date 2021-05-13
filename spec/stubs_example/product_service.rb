class ProdcutService
@product = Product.find_by id: params[:id]
return if @product

end
