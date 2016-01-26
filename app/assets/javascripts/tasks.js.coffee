$(document).ready ->
#Enable sorting
  $('.sortable').sortable (
    axis: 'y'
    items: '.taskRow'
    handle: '#sort'
    cursor: 'move'
  )
  $(document).on 'sortupdate', '.sortable', ->
    updated_order = []
    $('.taskRow').each (i) ->
      updated_order.push { id: $(this).attr("id"), position: i+1 }
    $.ajax {type: "PUT", url: '/tasks/sort', data: { order: updated_order }}
####

#Enable Edit task form
  $.fn.editable.defaults.send = "always"
  $('.taskName').editable 'disable'

  $(document).on 'click', '.editTask', (e)->
    e.stopPropagation()
    $(this).closest('tr').find('.taskName').editable 'enable'
    $(this).closest('tr').find('.taskName').editable 'toggle'

  $('.taskName').on 'hidden', (e, reason) ->
    $(this).editable 'disable'

  $(document).on 'click', '.taskRow .editable-submit',->
    $.ajax {type: "PUT", url: '/tasks/update', data: {id: $(this).closest('tr').attr("id"), new_value: $('.input-sm').val() }}
####

#Hide task options
  $(document).on 'mouseover', '.taskRow', (e)->
    $(this).find('.taskOptions').show()
  $(document).on 'mouseout', '.taskRow', (e)->
    $(this).find('.taskOptions').hide()
####

#Change task status
  $(document).on 'change', '#task_checkbox', ->
    $.ajax {type: "PUT", url: 'tasks/change_status', data: {id: $(this).val()}}
####