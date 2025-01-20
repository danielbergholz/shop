defmodule ShopWeb.PageControllerTest do
  use ShopWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, ~p"/")
    assert html_response(conn, 200) =~ "Shop"
  end
end
