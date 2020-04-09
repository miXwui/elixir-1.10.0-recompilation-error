defmodule Servy.Handler do
  alias Servy.Module

  def something(conv) do
    Module.index(conv)
  end
end

Servy.Handler.something(%{resp_body: ""})
