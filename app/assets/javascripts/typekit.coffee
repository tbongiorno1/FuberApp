((d) ->
  config =
    kitId: 'wxl2jhm'
    scriptTimeout: 3000
    async: true
  h = d.documentElement
  t = setTimeout((->
    h.className = h.className.replace(/\bwf-loading\b/g, '') + ' wf-inactive'
    return
  ), config.scriptTimeout)
  tk = d.createElement('script')
  f = false
  s = d.getElementsByTagName('script')[0]
  a = undefined
  h.className += ' wf-loading'
  tk.src = 'https://use.typekit.net/' + config.kitId + '.js'
  tk.async = true
  tk.onload =
  tk.onreadystatechange = ->
    a = @readyState
    if f or a and a != 'complete' and a != 'loaded'
      return
    f = true
    clearTimeout t
    try
      Typekit.load config
    catch e
    return

  s.parentNode.insertBefore tk, s
  return
) document
