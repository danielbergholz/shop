defmodule ShopWeb.ProductJSON do
  def index(_assigns) do
    %{
      data: [
        %{name: "God of war"},
        %{name: "Skyrim"},
        %{name: "Diablo 4"}
      ]
    }
  end
end
