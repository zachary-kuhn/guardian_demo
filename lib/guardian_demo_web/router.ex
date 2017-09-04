defmodule GuardianDemoWeb.Router do
  use GuardianDemoWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", GuardianDemoWeb do
    pipe_through :api
  end
end
