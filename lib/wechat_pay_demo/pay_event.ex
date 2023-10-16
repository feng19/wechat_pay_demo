defmodule WechatPayDemo.PayEvent do
  @moduledoc false
  require Logger

  # 处理 回调消息
  def handle_event(_conn, message) do
    Logger.info("Got message: #{inspect(message)}")
    id = Map.get(message, "id")
    # 排重处理
    case Cachex.get(:event_id_cache, id) do
      {:ok, nil} ->
        # handle message here
        Cachex.put(:event_id_cache, id, :ok)
        :ok

      # already handled
      {:ok, v} ->
        v
    end
  end
end
