open("/home/ali/Spare Time/AdventofCode/2020/input-day3.txt") do f
    lines = readlines(f)
    q = length(lines[1])
    line_counter = 0
    t₁₁ = 0
    t₁₃ = 0
    t₁₅ = 0
    t₁₇ = 0
    t₂₁ = 0
    for line in lines
        line[mod(3*line_counter,q)+1] == '#' ? t₁₃ += 1 : t₁₃ += 0
        line[mod(5*line_counter,q)+1] == '#' ? t₁₅ += 1 : t₁₅ += 0
        line[mod(7*line_counter,q)+1] == '#' ? t₁₇ += 1 : t₁₇ += 0
        line[mod(line_counter,q)+1] == '#' ? t₁₁ += 1 : t₁₁ += 0
        if line_counter%2 == 0
            line[mod(line_counter÷2,q)+1] == '#' ? t₂₁ += 1 : t₂₁ += 0
        end
        line_counter += 1
    end
    println(t₁₃)
    println(t₁₁," ",t₁₃," ",t₁₅," ",t₁₇," ",t₂₁)
    println(t₁₁*t₁₃*t₁₅*t₁₇*t₂₁)
end
