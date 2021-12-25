defmodule MiniMaxSum.CLI do
  def main(_args) do
    t =
      IO.gets("")
      |> String.split(" ")
      |> Enum.map(fn x ->
        String.trim(x)
        |> String.to_integer()
      end)

    MiniMaxSum.minMaxSum(t)
  end
end
