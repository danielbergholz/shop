defmodule ShopWeb.PromotionJSON do
  alias Shop.Promotions.Promotion

  @doc """
  Renders a list of promotions.
  """
  def index(%{promotions: promotions}) do
    %{data: for(promotion <- promotions, do: data(promotion))}
  end

  @doc """
  Renders a single promotion.
  """
  def show(%{promotion: promotion}) do
    %{data: data(promotion)}
  end

  defp data(%Promotion{} = promotion) do
    %{
      id: promotion.id,
      name: promotion.name,
      code: promotion.code
    }
  end
end
