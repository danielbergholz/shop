defmodule Shop.ProductsTest do
  use Shop.DataCase

  alias Shop.Products
  alias Shop.Products.Product
  import Shop.ProductsFixtures

  test "create_product/1 creates a product" do
    assert {:ok, %Product{}} =
             Products.create_product(%{
               name: "some game",
               console: :pc
             })
  end

  test "list_products/0 returns all products" do
    product = product_fixture()
    assert Products.list_products() == [product]
  end
end
