array = ["a", "b", "c", "1", "D"]

to_upper_case = fn x -> String.upcase(x) end
not_digit = fn x -> 
    case Integer.parse(x) do
        :error -> true
        {int, ""} -> !is_number(int)
    end
end

result = array
    |> Enum.map(to_upper_case)
    |> Enum.filter(not_digit)
    |> Enum.join(",")

IO.puts result