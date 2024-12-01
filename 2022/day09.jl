function dist(a, b)
    return max(abs.(a - b)...)
end

function move(h, t)
    d = h - t
    d[1] > 0 && d[2] > 0 && return [1, 1]
    d[1] > 0 && d[2] == 0 && return [1, 0]
    d[1] > 0 && d[2] < 0 && return [1, -1]
    d[1] < 0 && d[2] > 0 && return [-1, 1]
    d[1] < 0 && d[2] == 0 && return [-1, 0]
    d[1] < 0 && d[2] < 0 && return [-1, -1]
    d[1] == 0 && d[2] == 0 && return [0, 0]
    d[1] == 0 && d[2] > 0 && return [0, 1]
    d[1] == 0 && d[2] < 0 && return [0, -1]
end


open("/home/ali/Spare Time/AdventofCode/2022/input-day09.txt", "r") do f
    rx = r"(.) (.+)"
    up = [-1, 0]
    down = [1, 0]
    right = [0, 1]
    left = [0, -1]
    lines = readlines(f)
    a = sparse([20000], [20000], [true], 40000, 40000)
    h = [20000, 20000]
    t = [20000, 20000]
    for l in lines
        m = match(rx, l)
        c = m[1][1]
        n = parse(Int, m[2])
        for i in 1:n
            c == 'U' && (h += up)
            c == 'D' && (h += down)
            c == 'R' && (h += right)
            c == 'L' && (h += left)
            if dist(h, t) > 1
                t += move(h, t)
            end
            a[t...] = true
        end

    end
    println(sum(a))

    
    a = sparse([20000], [20000], [true], 40000, 40000)
    h = [20000, 20000]
    h1 = [20000, 20000]
    h2 = [20000, 20000]
    h3 = [20000, 20000]
    h4 = [20000, 20000]
    h5 = [20000, 20000]
    h6 = [20000, 20000]
    h7 = [20000, 20000]
    h8 = [20000, 20000]
    t = [20000, 20000]
    for l in lines
        m = match(rx, l)
        c = m[1][1]
        n = parse(Int, m[2])
        for i in 1:n
            c == 'U' && (h += up)
            c == 'D' && (h += down)
            c == 'R' && (h += right)
            c == 'L' && (h += left)
            dist(h, h1) > 1 && (h1 += move(h, h1))
            dist(h1, h2) > 1 && (h2 += move(h1, h2))
            dist(h2, h3) > 1 && (h3 += move(h2, h3))
            dist(h3, h4) > 1 && (h4 += move(h3, h4))
            dist(h4, h5) > 1 && (h5 += move(h4, h5))
            dist(h5, h6) > 1 && (h6 += move(h5, h6))
            dist(h6, h7) > 1 && (h7 += move(h6, h7))
            dist(h7, h8) > 1 && (h8 += move(h7, h8))
            dist(h8, t) > 1 && (t += move(h8, t))
            a[t...] = true
        end
    end
    println(sum(a))
end