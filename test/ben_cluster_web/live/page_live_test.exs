defmodule BenClusterWeb.PageLiveTest do
  use BenClusterWeb.ConnCase

  import Phoenix.LiveViewTest

  test "disconnected and connected render", %{conn: conn} do
    {:ok, page_live, disconnected_html} = live(conn, "/")
    assert disconnected_html =~ "Distributed Elixir Cluster with libcluster"
    assert render(page_live) =~ "Distributed Elixir Cluster with libcluster"
  end
end
