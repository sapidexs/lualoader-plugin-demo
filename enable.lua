require("io")

function Enable()
    print("hello!")
    local command = "pwd"
    local file = io.popen(command)
    local path = file:read("*line")
    file:close()
    print("work in", path)
end