local q=__queries
local page=1
if (q.page and tonum(q.page)!=nil) then
    page=q.page
end

if (page>1) then
    getElementById("prevpage"):set("target","?page="..tostr(page-1))
end
getElementById("nextpage"):set("target","?page="..tostr(page+1))

local db=request(page,7,nil,8)
function _update()
    --make async, doesn't work right (pml issue i think)
    while (#db>0) do
        pushBBSPost(db[1],"p8.png")
        deli(db,1)
    end
end