using LightGraphs
using SimpleWeightedGraphs
using Cairo, Compose
rule_head = r"([a-z]+) ([a-z]+) bags contain"
rule_tail = r"(\d+) ([a-z]+) ([a-z]+) bag[s.,]"
open("/home/ali/Spare Time/AdventofCode/2020/input-day7.txt") do f
    s = readlines(f)
    len = length(s)
    nodes = [match(rule_head,i)[1]*" "*match(rule_head,i)[2] for i in s]
    d = Dict([nodes[i]=>i for i in 1:len])
    G = SimpleWeightedDiGraph(len)
    for st in s
        head_string = match(rule_head,st)[1]*" "*match(rule_head,st)[2]
        head_id = d[head_string]
        for m in eachmatch(rule_tail,st)
            tail_string = m[2]*" "*m[3]
            tail_id = d[tail_string]
            w = parse(Int,m[1])
            add_edge!(G,SimpleWeightedEdge(head_id,tail_id,w))
        end
    end
    t = d["shiny gold"]
    counter = -1
    for i in 1:len
        if has_path(G,i,t)
            counter += 1
        end
    end
    bags = neighborhood(G,t,30)
    G2 = G[bags]
    bag_count = zeros(length(bags))
    bag_count[1] = 1
    w = weights(G2)
    su = 0
    while sum(bag_count) != 0
        bag_count = transpose(w)*bag_count
        su += sum(bag_count)
    end
    println(su)
    draw(PNG("G2.png",16cm,16cm),gplot(G2))
end