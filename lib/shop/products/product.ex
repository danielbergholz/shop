defmodule Shop.Products.Product do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Jason.Encoder, only: [:name, :console, :slug]}
  schema "products" do
    field :name, :string
    field :console, Ecto.Enum, values: [:pc, :xbox, :nintendo, :playstation]
    field :slug, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(product = %__MODULE__{}, attrs) do
    product
    |> cast(attrs, [:name, :console])
    |> validate_required([:name, :console])
    |> validate_length(:name, min: 3)
    |> format_name()
    |> generate_slug()
    |> unique_constraint(:slug)
  end

  defp format_name(changeset = %Ecto.Changeset{}) do
    name =
      changeset.changes.name
      |> String.trim()

    put_change(changeset, :name, name)
  end

  defp generate_slug(changeset = %Ecto.Changeset{}) do
    slug =
      changeset.changes.name
      |> String.downcase()
      |> String.replace(" ", "-")

    put_change(changeset, :slug, slug)
  end
end
