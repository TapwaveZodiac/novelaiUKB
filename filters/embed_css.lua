function addCSS (meta)
  -- intercept css files passed as metadata and embed them
  if meta.css == nil then
    return(meta)
  end

  -- read current "header-includes" from metadata, or make a new one
  -- and add css to the end of "header-includes"
  local current = meta['header-includes'] or pandoc.MetaList{meta['header-includes']}

  for _,f in pairs(meta.css) do
    -- read css file and get the string content
    local file = io.open(f, "r")
    local css = file:read("*all")
    file:close()
    current[#current+1] = pandoc.MetaBlocks(pandoc.RawBlock("html", "<style>\n" .. css .. "\n</style>"))
  end

  -- remove css from metadata
  meta.css = nil

  meta['header-includes'] = current

  return(meta)
end

return {
  { Meta = addCSS },
}
