local _objects = {}

return {
  add = function (o)
    _objects[o] = true
  end,
  remove = function (o)
    _objects[o] = nil
  end,
  map = function(f, ...)
    for o,_ in pairs(_objects) do
      if type(f) == 'function' then
        f(o, ...)
      elseif type(f) == 'string' then
        if o[f] then o[f](o, ...) end
      end
    end
  end,
}
