defmodule GuardianDemoWeb.Router do
  use GuardianDemoWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :unauthorized do
    plug :fetch_session
  end

  pipeline :authorized do
    plug :fetch_session
    plug Guardian.Plug.Pipeline, module: GuardianDemo.Guardian,
      error_handler: GuardianDemo.AuthErrorHandler
    plug Guardian.Plug.VerifySession
    plug Guardian.Plug.LoadResource
  end

  scope "/api", GuardianDemoWeb do
    pipe_through :api

    scope "/users" do
      scope "/" do
        pipe_through :unauthorized
  
        post "/sign-in", UserController, :sign_in
      end
  
      scope "/" do
        pipe_through :authorized
  
        post "/sign-out", UserController, :sign_out
        get "/me", UserController, :show
      end
    end
  end
end
