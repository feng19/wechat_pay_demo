defmodule WechatPayDemo do
  @moduledoc """
  WechatPayDemo keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  alias WeChat.Pay.Transactions
  @client WechatPayDemo.PayClient

  @doc "小程序/jsapi 下单"
  def jsapi(appid, description, out_trade_no, notify_url, amount, payer) do
    with {:ok, %{status: 200, body: %{"prepay_id" => prepay_id}}} <-
           Transactions.jsapi(
             @client,
             appid,
             description,
             out_trade_no,
             notify_url,
             amount,
             payer
           ) do
      Transactions.request_payment_args(@client, appid, prepay_id)
    end
  end

  @doc "付款码支付"
  def pay_by_scan(appid, description, out_trade_no, amount, ip, auth_code) do
    Transactions.pay_by_scan(@client, %{
      "appid" => appid,
      "mch_id" => @client.mch_id(),
      "nonce_str" => random_string(),
      "sign_type" => "HMAC-SHA256",
      "body" => description,
      "out_trade_no" => out_trade_no,
      "total_fee" => amount,
      "fee_type" => "CNY",
      "spbill_create_ip" => ip,
      "auth_code" => auth_code
    })
  end

  @doc "撤销订单"
  def revoke(appid, out_trade_no) do
    Transactions.revoke(@client, %{
      "appid" => appid,
      "mch_id" => @client.mch_id(),
      "out_trade_no" => out_trade_no,
      "nonce_str" => random_string(),
      "sign_type" => "HMAC-SHA256"
    })
  end

  defp random_string(bytes \\ 24) do
    :crypto.strong_rand_bytes(bytes) |> Base.url_encode64()
  end
end
