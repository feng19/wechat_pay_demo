defmodule WechatPayDemo.PayEvent do
  @moduledoc false
  require Logger

  # 处理 回调消息
  def handle_event(_conn, message) do
    Logger.info(message)
    :ok
  end
end
