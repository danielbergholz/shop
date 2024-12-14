defmodule Shop.Product do
  use Ecto.Schema
  import Ecto.Changeset

  schema "products" do
    field :name, :string
    field :console, Ecto.Enum, values: [:pc, :xbox, :nintendo, :playstation]
    field :slug, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:name, :slug, :console])
    |> validate_required([:name, :slug, :console])
    |> unique_constraint(:slug)
  end
end
