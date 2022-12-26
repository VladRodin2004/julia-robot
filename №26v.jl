n = readline()
n = parse(Int64, n)
check_arr = Array{Int64}(undef, n)
for i in 1:n
    check_arr[i] = 0
end


function fibonacci_memoiz!(n::Int64)
    if n <= 1
        return n
    else 
        if check_arr[n] == 0
            check_arr[n] = fibonacci_memoiz!(n-1) + fibonacci_memoiz!(n-2)
        end
    end
    return check_arr[n]
end

println(fibonacci_memoiz!(n))