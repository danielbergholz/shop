defmodule Shop.Repo.Migrations.CreateProducts do
  use Ecto.Migration

  def change do
    create table(:products) do
      add :name, :string
      add :slug, :string
      add :console, :string

      timestamps(type: :utc_datetime)
    end

    create unique_index(:products, [:slug])
  end
end
