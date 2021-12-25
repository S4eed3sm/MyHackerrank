defmodule MiniMaxSum do
  @spec minMaxSum(list) :: :ok
  def minMaxSum(arr) do
      diffs = arr
      |> Enum.sum()
      |> List.duplicate(length(arr))
      |> Enum.zip_with( arr, fn x,y -> x - y end)
      IO.puts("#{Enum.min(diffs)} #{Enum.max(diffs)}")
  end
end
