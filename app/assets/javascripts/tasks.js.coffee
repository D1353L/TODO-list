$(document).ready ->

  $(document).on 'mouseover', '.taskRow', ->
    $(this).find('div').show()

  $(document).on 'mouseout', '.taskRow', ->
    $(this).find('div').hide()

  $(document).on 'change', '#task_checkbox', ->
    $.post('tasks/change_status?id='+$(this).val())

return