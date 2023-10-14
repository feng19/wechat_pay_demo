defmodule WechatPayDemoWeb.PayRouter do
  use Plug.Router

  plug :match
  plug :dispatch

  Code.ensure_compiled!(WechatPayDemo.PayClient)

  post "/api/pay/callback",
    to: WeChat.Pay.EventHandler,
    init_opts: [
      client: WechatPayDemo.PayClient,
      event_handler: &WechatPayDemo.PayEvent.handle_event/2
    ]

  match _, do: conn
end
