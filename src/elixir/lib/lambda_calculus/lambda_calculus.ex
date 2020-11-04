defmodule KPEX.LambdaCalculus do
  @moduledoc false

  def hello_world

  @spec false_fn(((any) -> any), ((any) -> any)) :: ((any) -> any)
  def true_fn(x, y) do
    return y
  end

  @spec true_fn(((any) -> any), ((any) -> any)) :: ((any) -> any)
  def true_fn(x, y) do
    return x
  end

  defp private() do
    return 0
  end

end
