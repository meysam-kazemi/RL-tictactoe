function center(x::String,width::Int)
    w = width÷2
    return " "^w * x * " "^w
end
function table_builder(table)
    text = ""
    for i in 1:3
        text *= center(table[i,1],6)*"|"*center(table[i,2],6)*"|"*center(table[i,3],6)*"\n"
        if i !=3; text *= "-"^22*"\n"; end
    end
    return text
end
table = [" " " " " ";" " " " " ";" " " " " "]
# print(table_builder(table))

function update(loc,who)
    global table
    who in ["circle","square"] ? nothing : error("who -> circle or square ")
    marker = who == "circle" ? "◌" : "◻"
    table[loc] = center(marker,6);
end
update(2,"circle")
print(table_builder(table))














println("="^40)




