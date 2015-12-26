$(document).ready ->

  $(document).on 'mouseover', '.taskRow', ->
    $(this).find('div').show()

  $(document).on 'mouseout', '.taskRow', ->
    $(this).find('div').hide()

  $(document).on 'change', '#task_checkbox', ->
    $.ajax {type: "PUT", url: 'tasks/change_status', data: {id: $(this).val()}};

  $('.sortable').sortable (
    axis: 'y'
    items: '.taskRow'
    handle: '#sort'
    cursor: 'move'
  )

  $(document).on 'sortupdate', '.sortable', ->
    # array to store new order
    updated_order = []
    # the updated_order array with the new task positions
    $('.taskRow').each (i) -> updated_order.push { id: $(this).attr("id"), position: i+1 }
    # send the updated order via ajax
    $.ajax {type: "PUT", url: '/tasks/sort', data: { order: updated_order }}

return