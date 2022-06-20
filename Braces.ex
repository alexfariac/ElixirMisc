defmodule Braces do
  def valid_braces_reg(braces), do: String.match?(braces, ~r/^((\((?1)\)|\[(?1)\]|\{(?1)\})*)$/)

  def valid_braces(braces) do
    braces
    |> String.graphemes()
    |> do_valid_braces()
  end

  defp do_valid_braces(braces, stack \\ [])
  defp do_valid_braces([], []), do: true
  defp do_valid_braces([], _), do: false
  defp do_valid_braces([braces_head | braces_tail], stack) when braces_head in ["(", "[", "{"], do: do_valid_braces(braces_tail, [braces_head | stack])
  defp do_valid_braces([")" | braces_tail], ["(" | stack_tail]), do: do_valid_braces(braces_tail, stack_tail)
  defp do_valid_braces(["]" | braces_tail], ["[" | stack_tail]), do: do_valid_braces(braces_tail, stack_tail)
  defp do_valid_braces(["}" | braces_tail], ["{" | stack_tail]), do: do_valid_braces(braces_tail, stack_tail)
  defp do_valid_braces([braces_head | _], _stack) when braces_head in [")", "]", "}"], do: false
end
