using DelimitedFiles
data = readdlm("2024/input-day01.txt",Int)
data1 = sort(data[:,1])
data2 = sort(data[:,2])
@show sum([abs(data1[i]-data2[i]) for i in 1:1000])
@show sum([data1[i]*count(x -> x == data1[i], data2) for i in 1:1000])