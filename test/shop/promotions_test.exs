defmodule Shop.PromotionsTest do
  use Shop.DataCase, async: true

  alias Shop.Promotions

  describe "promotions" do
    alias Shop.Promotions.Promotion

    import Shop.PromotionsFixtures

    @invalid_attrs %{code: nil, name: nil}

    test "list_promotions/0 returns all promotions" do
      promotion = promotion_fixture()
      assert Promotions.list_promotions() == [promotion]
    end

    test "get_promotion!/1 returns the promotion with given id" do
      promotion = promotion_fixture()
      assert Promotions.get_promotion!(promotion.id) == promotion
    end

    test "create_promotion/1 with valid data creates a promotion" do
      valid_attrs = %{code: "some code", name: "some name"}

      assert {:ok, %Promotion{} = promotion} = Promotions.create_promotion(valid_attrs)
      assert promotion.code == "some code"
      assert promotion.name == "some name"
    end

    test "create_promotion/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Promotions.create_promotion(@invalid_attrs)
    end

    test "update_promotion/2 with valid data updates the promotion" do
      promotion = promotion_fixture()
      update_attrs = %{code: "some updated code", name: "some updated name"}

      assert {:ok, %Promotion{} = promotion} =
               Promotions.update_promotion(promotion, update_attrs)

      assert promotion.code == "some updated code"
      assert promotion.name == "some updated name"
    end

    test "update_promotion/2 with invalid data returns error changeset" do
      promotion = promotion_fixture()
      assert {:error, %Ecto.Changeset{}} = Promotions.update_promotion(promotion, @invalid_attrs)
      assert promotion == Promotions.get_promotion!(promotion.id)
    end

    test "delete_promotion/1 deletes the promotion" do
      promotion = promotion_fixture()
      assert {:ok, %Promotion{}} = Promotions.delete_promotion(promotion)
      assert_raise Ecto.NoResultsError, fn -> Promotions.get_promotion!(promotion.id) end
    end

    test "change_promotion/1 returns a promotion changeset" do
      promotion = promotion_fixture()
      assert %Ecto.Changeset{} = Promotions.change_promotion(promotion)
    end
  end
end
