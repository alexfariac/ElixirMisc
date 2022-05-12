defmodule Random.Random do
  @seed 1
  @a 22695477
  @m 16777216
  @c 1

  defp congruentelinear() do
    @seed
    |> Stream.iterate(&(rem(@a * &1 + @c, @m)))
    |> Stream.map(&(&1/@m))
  end

  def take_cl(n) do
    values =
      congruentelinear()
      |> Enum.take(n)

    [_|tail] = values
    tail
  end


  defp take do
    :rand.uniform()
  end

  def take(n) do
    for _ <- 1..n, do: take()
  end
end
