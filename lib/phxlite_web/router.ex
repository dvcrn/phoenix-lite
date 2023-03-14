defmodule PhxliteWeb.Router do
  use PhxliteWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {PhxliteWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug :put_view, html: PhxliteWeb.PageHTML
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PhxliteWeb do
    pipe_through :browser

    # render normal controller (not live)
    get "/", PageController, :home

    # 2 ways of rendering liveviews, by using 'live'
    # or by having a controller rendering it
    live "/live", IndexLive, :index
    get "/livecontroller", PageController, :anotherpage
  end

  # Other scopes may use custom stacks.
  # scope "/api", PhxliteWeb do
  #   pipe_through :api
  # end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:phxlite, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: PhxliteWeb.Telemetry
    end
  end
end
