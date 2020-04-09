defmodule Servy.Module do
  def index(conv) do
    %{conv | resp_body: "Edit me"}
  end
end
