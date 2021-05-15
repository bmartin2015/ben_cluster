defmodule BenClusterWeb.PageLive do
  @moduledoc false
  use BenClusterWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    self_node = inspect(node())
    nodes = inspect(Node.list())

    {:ok, assign(socket, node: self_node, nodes: nodes)}
  end

  # @impl true
  # def handle_event("suggest", %{"q" => query}, socket) do
  #   {:noreply, assign(socket, results: search(query), query: query)}
  # end
end
