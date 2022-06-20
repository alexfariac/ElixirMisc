defmodule TwoSum do
  @spec two_sum([integer()], integer()) :: {integer(), integer()}
  def two_sum(list, target) do
    list
    |> Enum.with_index()
    |> do_two_sum(target)
  end

  defp do_two_sum([{val, idx} | tail], target) do
    i = find_index(tail, target-val)

    case i do
      nil -> do_two_sum(tail, target)
      _ -> {idx, i}
    end
  end

  defp find_index([], _), do: nil
  defp find_index([{value, index}|_tail], target) when target == value, do: index
  defp find_index([_|tail], target), do: find_index(tail, target)

end

TwoSum.two_sum([1, 2, 3], 4) in [{0, 2}, {2, 0}] |> IO.inspect()
TwoSum.two_sum([1234, 5678, 9012], 14690) in [{1, 2}, {2, 1}] |> IO.inspect()
TwoSum.two_sum([2, 2, 4], 4) in [{0, 1}, {1, 0}] |> IO.inspect()
