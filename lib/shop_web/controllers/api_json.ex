defmodule ShopWeb.ApiJSON do
  def index(%{products: products}) do
    %{products: products}
  end
end
