defmodule WechatPayDemo.PayClient do
  @moduledoc false

  use WeChat.Pay,
    mch_id: "mch_id",
    api_secret_key: :runtime_env,
    client_serial_no: "client_serial_no",
    client_key: {:app_dir, :wechat_pay_demo, "priv/cert/apiclient_key.pem"}
end
