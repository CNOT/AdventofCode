data_str = split.(readlines("2024/input-day02.txt"))
data = [parse.(Int, x) for x in data_str]

function is_safe(arr)
    l = length(arr)
    all(x -> 0< x <= 3,[abs(arr[i] - arr[i+1]) for i in 1:l-1]) && (arr == sort(arr) || arr == reverse(sort(arr)))
end 

count(is_safe, data)

function is_safe2(arr)
    l = length(arr)
    l2 = []
    for i in 1:l
        item = popat!(arr, i)
        tmp = deepcopy(arr)
        push!(l2, tmp)
        insert!(arr, i, item)
    end
    any(is_safe.(l2))
end
    
count(is_safe2, data)