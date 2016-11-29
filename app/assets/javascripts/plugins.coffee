# Close navbar after clicking a link
$('.nav a').click ->
  $('.navbar-collapse').collapse 'hide'
  return

# Change navbar color after scrolling and animate transition
$(document).ready ->
  scroll_start = 0
  startchange = $('#mutate')
  offset = startchange.offset()
  if startchange.length
    $(document).scroll ->
      scroll_start = $(this).scrollTop()
      if scroll_start > offset.top
        $('.navbar-inverse').css('background-color', '#575B6B').addClass 'animated fadeInDown'
      else
        $('.navbar-inverse').css 'background-color', 'transparent'
      return
  return

# Adds smooth scrolling to links
$ ->
  $('a[href*="#"]:not([href="#"])').click ->
    if location.pathname.replace(/^\//, '') == @pathname.replace(/^\//, '') and location.hostname == @hostname
      target = $(@hash)
      target = if target.length then target else $('[name=' + @hash.slice(1) + ']')
      if target.length
        $('html, body').animate { scrollTop: target.offset().top }, 1000
        return false
    return
  return
