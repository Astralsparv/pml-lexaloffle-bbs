function request(page,cat,sub,max)
    max=max or 32
    page=page or 1
    local req="https://www.lexaloffle.com/bbs/pod.php?&max="..max.."&start_index="..(page*max)
    if (cat) req..="&cat="..cat
    if (sub) req..="&sub="..sub
    return fetch(req)
end

function pushBBSPost(p,ext)
    if (ext:sub(1)!=".") ext="."..ext
    --https://www.lexaloffle.com/bbs/cposts/(first two characters of bbs id)/(bbsid).(ext)
    local url="https://www.lexaloffle.com/bbs/cposts/"
    url..=(p.id:sub(1,2)).."/"
    url..=(p.id)..ext
    local title=pushElement("title")
    title:set("margin_left",2)
    title:set("align","left")
    title:set("text",p.title)
    local author=pushElement("text")
    author:set("margin_left",2)
    author:set("align","left")
    author:set("text",p.author)
    local timestamp=pushElement("p8text")
    timestamp:set("margin_left",2)
    timestamp:set("align","left")
    timestamp:set("text",p.ts)
    local thumbpng=p.thumb
    if (ext==".p8.png") then
        thumbpng=thumbpng:gsub("pico64", "pico8")
    end
    if (ext==".vx.png") then
        thumbpng=thumbpng:gsub("pico64", "vox")
    end
    local thumb=pushElement("image",{src=thumbpng})
    thumb:set("align","left")
    local link=pushElement("link")
    link:set("margin_left",2)
    link:set("align","left")
    link:set("text","#"..p.id)
    link:set("target",url)
    link:set("method","download")
end