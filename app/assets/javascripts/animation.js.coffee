$(document).ready ->
#Hide/show project options
  $(document).on 'mouseover', '.projectHead', ->
    $(this).find('.projectOptions').show()
  $(document).on 'mouseout', '.projectHead', ->
    $(this).find('.projectOptions').hide()
####

#Hide/show task options
  $(document).on 'mouseover', '.taskRow', (e)->
    $(this).find('.taskOptions').show()
  $(document).on 'mouseout', '.taskRow', (e)->
    $(this).find('.taskOptions').hide()
####

