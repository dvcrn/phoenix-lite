defmodule PhxliteWeb.IndexLive do
  use PhxliteWeb, :live_view

  def mount(_params, session, socket) do
    {:ok, assign(socket, :rendered_by, Map.get(session, "rendered_by", "unspecified"))}
  end

  def render(assigns) do
    ~H"""
    <div>
      <h1>Hi, I'm IndexLive, rendered by <%= assigns.rendered_by %></h1>
      <.live_component module={PhxliteWeb.SimpleComponent} id="myid" />
      <.live_component module={PhxliteWeb.SimpleComponent} id="myid2" />
      <.live_component module={PhxliteWeb.SimpleComponent} id="myid3" />
      <.live_component module={PhxliteWeb.SimpleComponent} id="myid4" />
    </div>
    """
  end
end
