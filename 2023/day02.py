import re
data = open("input-2.txt","r")
d = data.readlines()
total = 0
for i in d:
    game_id = int(re.search("Game (\d+)",i)[1])
    t = i.split(';')
    tmp_bool = True
    for s in t:
        r,g,b = 0,0,0
        if re.search("(\d+) blue",s):
            b = int(re.search("(\d+) blue",s)[1])
        if re.search("(\d+) red",s):
            r = int(re.search("(\d+) red",s)[1])
        if re.search("(\d+) green",s):
            g = int(re.search("(\d+) green",s)[1])
        if b > 14 or g > 13 or r > 12:
            tmp_bool = False
            break
    if tmp_bool:
        total = total + game_id
            
print(total)    
    
power = 0
for i in d:
    t = i.split(';')
    r,g,b = 0,0,0
    for s in t:
        if re.search("(\d+) blue",s):
            b = max(b,int(re.search("(\d+) blue",s)[1]))
        if re.search("(\d+) red",s):
            r = max(r,int(re.search("(\d+) red",s)[1]))
        if re.search("(\d+) green",s):
            g = max(g,int(re.search("(\d+) green",s)[1]))
    power = power + r*g*b
    
print(power)
data.close()