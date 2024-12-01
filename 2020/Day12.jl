mutable struct posdir
    x :: Int
    y :: Int
    dir :: Int #north = 0, east = 1, south = 2, west = 3
end

function move!(com,step::Int,p::posdir)
    com == "N" && (p = posdir(p.x,p.y+step,p.dir); return p)
    com == "E" && (p = posdir(p.x+step,p.y,p.dir); return p)
    com == "S" && (p = posdir(p.x,p.y-step,p.dir); return p)
    com == "W" && (p = posdir(p.x-step,p.y,p.dir); return p)
    com == "L" && (p = posdir(p.x,p.y,mod(p.dir-step÷90,4)); return p)
    com == "R" && (p = posdir(p.x,p.y,mod(p.dir+step÷90,4)); return p)
    if com == "F" 
        if p.dir == 0
            p = posdir(p.x,p.y+step,p.dir); return p
        elseif p.dir == 1
            p = posdir(p.x+step,p.y,p.dir); return p
        elseif p.dir == 2
            p = posdir(p.x,p.y-step,p.dir); return p
        elseif p.dir == 3
            p = posdir(p.x-step,p.y,p.dir); return p
        end
    end
end

reg = r"(.)(\d+)"

open("input-day12.txt") do f
    p = posdir(0,0,1)
    s = readlines(f)
    for i in s
        p = move!(match(reg,i)[1],parse(Int,match(reg,i)[2]),p)
    end
    println(p)
    println(abs(p.x)+abs(p.y))
end


#part 2
mutable struct posdir2
    x :: Int
    y :: Int
    wx :: Int 
    wy :: Int
end

function move!(com,step::Int,p::posdir2)
    com == "N" && (p = posdir2(p.x,p.y,p.wx,p.wy+step); return p)
    com == "E" && (p = posdir2(p.x,p.y,p.wx+step,p.wy); return p)
    com == "S" && (p = posdir2(p.x,p.y,p.wx,p.wy-step); return p)
    com == "W" && (p = posdir2(p.x,p.y,p.wx-step,p.wy); return p)
    if com == "L" 
        step == 90 && (p = posdir2(p.x,p.y,-p.wy,p.wx); return p)
        step == 180 && (p = posdir2(p.x,p.y,-p.wx,-p.wy); return p)
        step == 270 && (p = posdir2(p.x,p.y,p.wy,-p.wx); return p)
    end
    if com == "R" 
        step == 90 && (p = posdir2(p.x,p.y,p.wy,-p.wx); return p)
        step == 180 && (p = posdir2(p.x,p.y,-p.wx,-p.wy); return p)
        step == 270 && (p = posdir2(p.x,p.y,-p.wy,p.wx); return p)
    end
    if com == "F" 
        p = posdir2(p.x+step*p.wx,p.y+step*p.wy,p.wx,p.wy)
        return p
    end
end


open("input-day12.txt") do f
    p = posdir2(0,0,10,1)
    s = readlines(f)
    for i in s
        p = move!(match(reg,i)[1],parse(Int,match(reg,i)[2]),p)
    end
    println(abs(p.x)+abs(p.y))
end