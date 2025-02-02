defmodule ShopWeb.ProductLiveTest do
  use ShopWeb.ConnCase

  import Shop.ProductsFixtures

  test "LIVE /products-live", %{conn: conn} do
    product = product_fixture()

    assert {:ok, product_live, html} = live(conn, ~p"/products-live")
    assert html =~ "#{product.name} - Likes: 0"

    html = render_click(product_live, :like, %{"id" => to_string(product.id)})
    assert html =~ "#{product.name} - Likes: 1"

    html = render_click(product_live, :dislike, %{"id" => to_string(product.id)})
    assert html =~ "#{product.name} - Likes: 0"
  end
end
