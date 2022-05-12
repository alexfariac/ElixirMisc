#list = Enum.to_list(1..40)
inputs = %{
  "early index" => 10,
  "mid index" => 100,
  "late index" => 1000
}
#fn -> Enum.flat_map(list, map_fun) end,

Benchee.run(%{
  "generic fib" => fn param -> Fib.smart_take(param) end,
  "dynamic unfold fib" => fn param -> Fib.unfold_take(param) end,
  "dynamic iterate fib" => fn param -> Fib.iterate_take(param) end,
  "dynamic unfold fib 2" => fn param -> Fib.unfold_take_2(param) end
},
  warmup: 0,
  inputs: inputs,
  time: 10
)
