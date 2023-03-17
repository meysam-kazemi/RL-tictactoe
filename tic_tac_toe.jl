function center(x::String)
    w = 3
    return " "^w * x * " "^w
end
function table_builder(table)
    text = ""
    for i in 1:3
        text *= center(table[i,1])*"|"*center(table[i,2])*"|"*center(table[i,3])*"\n"
        if i !=3; text *= "-"^22*"\n"; end
    end
    return text
end
function update(loc,who)
    global table
    who in ["circle","square"] ? nothing : error("who -> circle or square ")
    marker = who == "circle" ? "◌" : "◻"
    table[loc] = marker;
end
table = ["1" "4" "7";"2" "5" "8";"3" "6" "9"]
print(table_builder(table))

ci_sq = ["circle","square"]
who_is_first = rand(ci_sq)
println("$(who_is_first) is first ...")
order = []
for i in 1:8
    global order
    i%2 != 0 ? push!(order,who_is_first) : push!(order,ci_sq[ci_sq.!=who_is_first][1])
end

function check_win()
    global table
    win = false
    for i in 1:3
        if all(i->i==table[i,1],table[i,:]) # Check if all elements are equal or not
            win = true 
        elseif all(i->i==table[1,i],table[:,i])
            win = true
        end
    end
    if table[1,1]==table[2,2] && table[1,1]==table[3,3]
        win = true
    elseif table[3,1]==table[2,2] && table[3,1]==table[1,3]
        win = true
    end
    return win
end

unchanged = ones(Bool,9)
for who in order
    global table,table
    print("$(who) : Please enter a location : ")
    loc = parse(Int8,readline())
    update(loc,who)
    Base.run(`clear`) # Clear the output
    print(table_builder(table))
    unchanged[loc] = 0
    if check_win()
        println("$who WIN !")
        break
    end
end
update(findall(x->x.==1,unchanged)[1],who_is_first)
Base.run(`clear`)
print(table_builder(table))
check_win()
if check_win()
    println("$who WIN !")
end










    

    
    

    












println("="^40)




