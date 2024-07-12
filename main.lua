-- main.lua

require("enable")
require("disable")


HandlerTable = {
    ["/hello"] = function (r)
        print("hello from lua")
        return {
            status = 200,
            header = {
                Test = {"a", "B"}
            },
            body = "hello http (from lua)"
        }
    end,
    ["/bye"] = function (r)
        print("bye from lua")
        return {
            status = 200,
            header = {
                Test = {"C", "d"}
            },
            body = "bye http (from lua)"
        }
    end,
    ["/test"] = function (r)
        print("get test")
        local strHeader = "header:\n"
        local strForm = "form:\n"
        local strPostForm = "postForm:\n"
        local strTrailer = "trailer:\n"
        local strURLQuery = "urlQuery:\n"
        for k, v in pairs(r.header) do
            for k2, v2 in pairs(v) do
                strHeader = strHeader .. string.format("%s: %d. %s\n", k, k2, v2)
            end
        end
        for k, v in pairs(r.form) do
            for k2, v2 in pairs(v) do
                strForm = strForm .. string.format("%s: %d. %s\n", k, k2, v2)
            end
        end
        for k, v in pairs(r.postForm) do
            for k2, v2 in pairs(v) do
                strPostForm = strPostForm .. string.format("%s: %d. %s\n", k, k2, v2)
            end
        end
        for k, v in pairs(r.trailer) do
            for k2, v2 in pairs(v) do
                strTrailer = strTrailer .. string.format("%s: %d. %s\n", k, k2, v2)
            end
        end
        for k, v in pairs(r.urlQuery) do
            for k2, v2 in pairs(v) do
                strURLQuery = strURLQuery .. string.format("%s: %d. %s\n", k, k2, v2)
            end
        end
        return {
            status = 200,
            header = {},
            body = string.format("method: %s\nproto: %s\nbody: %s\nhost: %s\nremoteAddr: %s\nrequestURI: %s\n========\n%s\n--------\n%s\n--------\n%s\n--------\n%s\n--------\n%s\n",
                r.method,
                r.proto,
                r.body,
                r.host,
                r.remoteAddr,
                r.requestURI,
                strHeader,
                strForm,
                strPostForm,
                strTrailer,
                strURLQuery
            )
        }
    end
}
