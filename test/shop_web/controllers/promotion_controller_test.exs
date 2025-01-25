defmodule ShopWeb.PromotionControllerTest do
  use ShopWeb.ConnCase

  import Shop.PromotionsFixtures

  alias Shop.Promotions.Promotion

  @create_attrs %{
    code: "some code",
    name: "some name"
  }
  @update_attrs %{
    code: "some updated code",
    name: "some updated name"
  }
  @invalid_attrs %{code: nil, name: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all promotions", %{conn: conn} do
      conn = get(conn, ~p"/api/promotions")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create promotion" do
    test "renders promotion when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/promotions", promotion: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/promotions/#{id}")

      assert %{
               "id" => ^id,
               "code" => "some code",
               "name" => "some name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/promotions", promotion: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update promotion" do
    setup [:create_promotion]

    test "renders promotion when data is valid", %{
      conn: conn,
      promotion: %Promotion{id: id} = promotion
    } do
      conn = put(conn, ~p"/api/promotions/#{promotion}", promotion: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/promotions/#{id}")

      assert %{
               "id" => ^id,
               "code" => "some updated code",
               "name" => "some updated name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, promotion: promotion} do
      conn = put(conn, ~p"/api/promotions/#{promotion}", promotion: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete promotion" do
    setup [:create_promotion]

    test "deletes chosen promotion", %{conn: conn, promotion: promotion} do
      conn = delete(conn, ~p"/api/promotions/#{promotion}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/promotions/#{promotion}")
      end
    end
  end

  defp create_promotion(_) do
    promotion = promotion_fixture()
    %{promotion: promotion}
  end
end
