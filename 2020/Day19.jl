# copied from Zulip.

input = readlines("input-day19.txt")

function parserule(rule)
  n,r = split(rule, ": ")
  r = replace(r, "\"" => "")
  subrules = split.(split(r, " | "), " ")
  subrules = [[r[1] in "ab" ? r[1] : parse(Int, r) for r in rule] for rule in subrules]
  parse(Int, n) => subrules
end

function compile_rule(allrules, i, part2)
  function compile(rules::Array{Char})
    rules[1]
  end
  function compile(rules::Array{Int64})
    re = [compile_rule(allrules, r, part2) for r in rules]

    if i == 8 && part2
      "$(re[1])+"
    elseif i == 11 && part2
      "($(join(["($(re[1])){$n}($(re[2])){$n}" for n in 1:5], "|")))"
    else
      join(re)
    end
  end

  regexps = compile.(allrules[i])
  length(regexps) == 1 ? regexps[1] : "($(join(regexps, "|")))"
end

rules = Dict(parserule.(input[1:133]))
m1 = Regex("^$(compile_rule(rules, 0, false))\$")
m2 = Regex("^$(compile_rule(rules, 0, true))\$")
part1 = count([match(m1, s) !== nothing for s in input[135:end]])
part2 = count([match(m2, s) !== nothing for s in input[135:end]])