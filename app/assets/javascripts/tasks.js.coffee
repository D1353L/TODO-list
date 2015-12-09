$(document).ready ->

  $(document).on 'mouseover', '.taskRow', ->
    $(this).find('div').show()

  $(document).on 'mouseout', '.taskRow', ->
    $(this).find('div').hide()

return