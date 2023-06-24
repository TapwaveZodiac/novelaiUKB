function convert_timestamp(meta)
  local timestamp = meta.date
  local day = os.date("%d/%m/%Y", timestamp)
  local hour = os.date("%H:%M", timestamp)
  meta.date = "Last updated " .. day .. " at " .. hour

  return meta
end

return {
  { Meta = convert_timestamp }
}
