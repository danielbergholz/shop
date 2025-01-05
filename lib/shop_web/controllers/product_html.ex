defmodule ShopWeb.ProductHTML do
  use ShopWeb, :html

  embed_templates "product_html/*"

  attr :name, :string, required: true

  def product(assigns) do
    ~H"""
    <p>Game: {@name}</p>
    """
  end
end
