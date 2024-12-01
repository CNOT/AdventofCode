case = r"([a-z]{3}):(.+)"
case_hgt = r"(\d+)([a-z]{2})"
required_keys = ["hcl","byr","iyr","eyr","hgt","ecl","pid"]
ecl_valid = ["amb", "blu", "brn", "gry", "grn", "hzl", "oth"]
open("/home/ali/Spare Time/AdventofCode/2020/input-day4.txt") do f
    s = split(read(f, String),"\n\n")
    valid_count = 0
    valid_count2 = 0
    for i in s
        si = split(i,('\n',' '))
        l = Dict([match(case,sii).captures for sii in si])
        if all([ri ∈ keys(l) for ri in required_keys])
            valid_count +=  1
            m = match(case_hgt,l["hgt"])
            if m === nothing
                continue
            else
                (hgt_number,hgt_unit) = m.captures
            end
            if (1920 <= parse(Int,l["byr"]) <= 2002) && (2010 <= parse(Int,l["iyr"]) <= 2020) && (2020 <= parse(Int,l["eyr"]) <= 2030) && length(l["hcl"]) == 7 && l["hcl"][1] == '#' && all([k ∈ ['0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'] for k in l["hcl"][2:7]]) && (l["ecl"] ∈ ecl_valid) && length(l["pid"])==9 && (match(r"\d{9}",l["pid"]) != nothing) 
                if (hgt_unit == "cm") && (150 <= parse(Int, hgt_number) <= 193)
                    valid_count2 += 1
                elseif (hgt_unit == "in") && (59 <= parse(Int, hgt_number) <= 76)
                    valid_count2  += 1
                end
            end

        end
    end
    println(valid_count)
    println(valid_count2)
end