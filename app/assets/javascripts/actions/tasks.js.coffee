$(document).ready ->
#Add task
  $(document).on 'click', '.addNewTask', (e)->
    taskField = $(this).closest('.input-group').find('.newTaskName')
    inputGroup = $(this).closest('.input-group')
    project = $(this).closest('.project')
    inputGroup.removeClass('has-error')
    taskField.tooltip('destroy')
    taskField.attr('placeholder', 'Start typing here to create a task...')

    if taskField.val().length > 255
      taskField.tooltip(title: 'Name is too long. Maximum 255 characters', placement: 'left')
      inputGroup.addClass('has-error')
    else
      if taskField.val()
        $.ajax {
          type: 'post',
          url: '/tasks/create',
          data: {task_name: taskField.val(), project_id: project.attr('id')}
          error: (jqXHR, error, errorThrown) ->
            inputGroup.addClass('has-error')
            taskField.tooltip(title: jqXHR.responseText, placement: 'left')
            return
        }
      else
        taskField.attr('placeholder', 'Name can\'t be blank')
        inputGroup.addClass('has-error')
####

#Sort tasks
  $(document).on 'mousemove',->
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

#Edit task
  $.fn.editable.defaults.mode = 'inline'
  $('.taskName').off('click')

  $(document).on 'mousemove',->
    $('.taskName').editable
      mode: 'inline',
      validate: (value)->
        if value.length > 255
          return 'Name is too long. Maximum 255 characters'
        if !value
          return "Name can't be blank"
      url: ->
        $.ajax {
          type: 'put',
          url: '/tasks/update',
          data: {id: $(this).closest('tr').attr("id"), new_value: $('.input-sm').val() }
        }

  $(document).on 'click', '.editTask', (e)->
    e.stopPropagation()
    $(this).closest('tr').find('.taskName').editable 'toggle'

  $('.taskName').on 'hidden', (e, reason) ->
    $(this).off('click')
####

#Change task status
  $(document).on 'change', '#task_checkbox', ->
    $.ajax {type: "PUT", url: 'tasks/change_status', data: {id: $(this).val()}}
####