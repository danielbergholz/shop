defmodule Shop.ProductsFixtures do
  def product_fixture(attrs \\ %{}) do
    {:ok, product} =
      attrs
      |> Enum.into(%{
        name: "some game",
        console: :pc
      })
      |> Shop.Products.create_product()

    product
  end
end
