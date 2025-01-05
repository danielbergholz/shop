defmodule ShopWeb.ProductHTML do
  use ShopWeb, :html
  alias Shop.Product

  embed_templates "product_html/*"

  attr :product, Product, required: true

  def product(assigns) do
    ~H"""
    <.link href={~p"/products/#{@product.slug}"} class="block">{@product.name}</.link>
    """
  end
end
