defmodule WechatPayDemoWeb.Router do
  use WechatPayDemoWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end
end
