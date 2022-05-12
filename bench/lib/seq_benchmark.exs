list = Enum.to_list(1..40)

Benchee.run(%{
  "recurssive Sequence"    => fn -> for n <- list, do: Sequence.r_take(n) end,
  "geneator funcion Sequence" => fn -> for n <- list, do: Sequence.take(n) end,
})
