defmodule ShopWeb.ApiController do
  use ShopWeb, :controller

  alias Shop.Products

  def index(conn, _params) do
    products = Products.list_products()

    conn
    |> assign(:products, products)
    |> render(:index)
  end
end
