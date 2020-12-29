
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

