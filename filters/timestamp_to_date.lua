function convert_timestamp(meta)
  local timestamp = meta.date
  local date = os.date("%d/%m/%Y %H:%M:%S", timestamp)
  meta.date = "Updated last " .. date

  return meta
end

return {
  { Meta = convert_timestamp }
}
