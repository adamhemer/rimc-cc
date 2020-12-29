
term.clear()
term.setCursorPos(0, 0)

w, h = term.getSize()

for i = 0, w do
    if i == 0 or i == w then
        term.write("|")
    else
        term.write("-")
    end
end

_corner = "+"
_sides = "|"

function drawBox(x, y, w, h)
    for j = y, h do
        for i = x, w do
            term.setCursorPos(i, j)
            if i == x or i == w then
                term.write(_corner)
            else
                term.write(_sides)
            end
        end
    end
end