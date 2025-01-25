defmodule ShopWeb.ProductControllerTest do
  use ShopWeb.ConnCase

  import Shop.ProductsFixtures

  test "GET /products", %{conn: conn} do
    product =
      product_fixture(%{
        name: "Halo Infinite",
        console: :xbox
      })

    conn = get(conn, "/products")
    assert html_response(conn, 200) =~ product.name
  end

  test "GET /products/:slug", %{conn: conn} do
    product =
      product_fixture(%{
        name: "Diablo 4",
        console: :playstation
      })

    conn = get(conn, "/products/#{product.slug}")
    assert html_response(conn, 200) =~ product.name
    assert html_response(conn, 200) =~ to_string(product.id)
    assert html_response(conn, 200) =~ to_string(product.console)
  end
end
