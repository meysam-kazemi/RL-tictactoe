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

function check_win()
    global table
    win = false
    for i in 1:3
        if table[1,i]==table[2,i] && table[1,i]==table[3,i]
            win = true
        elseif table[i,1]==table[i,2] && table[i,1]==table[i,3]
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

check_unchange(loc) = if !unchanged[loc] error("This location has already been selected") end

function human_action(symbol_)
    loc = parse(Int8,readline())
    if !(loc in 1:9) error("range of location is (1-9)") end
    check_unchange(loc)
    update(loc,symbol_)
    Base.run(`clear`) # Clear the output
    println("="^40)
    print(table_builder(table))
    unchanged[loc] = 0
end



function game(player1,player2)

    Base.run(`clear`) # Clear the output
    println("="^40)
    table = ["1" "4" "7";"2" "5" "8";"3" "6" "9"]
    print(table_builder(table))
    ci_sq = ["circle","square"]

    global unchanged = ones(Bool,9)

    # write actions





    
    # for who in order
    #     global table,table
    #     print("$(who) : Please enter a location : ")
    #     loc = parse(Int8,readline())
    #     if !(loc in 1:9) error("range of location is (1-9)") end
    #     check_unchange(loc,unchanged)
    #     update(loc,who)
    #     Base.run(`clear`) # Clear the output
    #     println("="^40)
    #     print(table_builder(table))
    #     unchanged[loc] = 0
    #     if check_win()
    #         println("$who WIN !")
    #         break
    #     end
    # end

    # if !check_win()
    #     update(findall(x->x.==1,unchanged)[1],who_is_first)
    #     Base.run(`clear`)
    #     println("="^40)
    #     print(table_builder(table))
    #     check_win()
    #     if check_win()
    #         println("--$who_is_first WIN!--")
    #     else
    #         println("--EQUAL!--")
    #     end
    # end
    # println("="^40)

end
