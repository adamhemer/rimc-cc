
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
_top = "-"

function drawBox(x, y, w, h)
    for j = y, h do
        for i = x, w do
            term.setCursorPos(i, j)
            if (i == x or i == w) and (j == y or j == h) then
                term.write(_corner)
            elseif i == x or i == w then
                term.write(_sides)
            elseif j == y or j == h then
                term.write(_top)
            end
        end
    end
end