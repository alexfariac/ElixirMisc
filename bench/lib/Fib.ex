defmodule Fib do

  defp sqrt(n), do: :math.sqrt(n)
  defp pow(n,m), do: :math.pow(n,m)

  def take(0), do: 0
  def take(1), do: 1
  def take(n) do
    Fib.take(n-1) + Fib.take(n-2)
  end

  def smart_take(n) do
    phib = (1 + sqrt(5)) / 2
    phis = (1 - sqrt(5)) / 2

    (pow(phib, n) - pow(phis, n))/sqrt(5)
    |> round() #done due to float imprecision, as a way of casting to integers
  end

  def unfold_take(n) do
    Stream.unfold({1,1}, fn {n, acc} -> {n ,{acc, n + acc}} end)
    |> Stream.take(n)
    |> Stream.take(-1)
    |> Enum.to_list()
    |> hd
  end

  def iterate_take(n) do
    Stream.iterate({1,1}, fn {x, y} -> {y, x + y} end)
    |> Stream.take(n)
    |> Stream.take(-1)
    |> Enum.to_list()
    |> hd
  end

  def unfold_take_2(n) do
    Stream.unfold({0,{0,1}}, fn
      {^n, _} -> nil
      {p, {x, y}} -> {{p, x}, {p+1, {y, x + y}}}
    end)
    |> Stream.take(-1)
    |> Enum.to_list()
    |> hd
    |> elem(1)
  end

end
