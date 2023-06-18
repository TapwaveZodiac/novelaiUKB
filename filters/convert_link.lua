function Link (element)
    local target = element.target

    -- return if the link is an external link
    if string.match(target, "^https?://") then
        return element
    end

    -- extract anchor from link to avoid it interfering with the link
    local anchor = string.match(target, "#.*$")
    if anchor ~= nil then
        -- escape hyphens in anchor
        local escaped_anchor = string.gsub(anchor, "-", "%%-")
        target = string.gsub(target, escaped_anchor, "")
    end

    -- fix link targets if they are relative links .md or no extension
    if string.match(target, "%.md$") then
        target = string.gsub(target, "%.md", ".html")
    elseif string.match(target, "%.[^%.]+$") == nil then
        target = target .. ".html"
    end

    -- add anchor back to link
    if anchor ~= nil then
        target = target .. anchor
    end

    element.target = target

    return element
end
