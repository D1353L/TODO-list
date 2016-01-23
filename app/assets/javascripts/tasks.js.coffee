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

#Enable Edit task form
  $.fn.editable.defaults.mode = 'inline'
  $('#taskName').editable 'disable', {
    type: 'text',
    url: '/tasks/update',
    pk: 1,
    placement: 'top',
  }
  $(document).on 'click', '.editTask', (e)->
    e.stopPropagation()
    $(this).closest('tr').find('#taskName').editable 'enable'
    $(this).closest('tr').find('#taskName').editable 'toggle'
  $('#taskName').on 'hidden', (e, reason) ->
    $(this).editable 'disable'

#Hide task options
  $(document).on 'mouseover', '.taskRow', ->
    $(this).find('div').show()
  $(document).on 'mouseout', '.taskRow', ->
    $(this).find('div').hide()

#Change task status
  $(document).on 'change', '#task_checkbox', ->
    $.ajax {type: "PUT", url: 'tasks/change_status', data: {id: $(this).val()}}