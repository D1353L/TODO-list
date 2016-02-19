$(document).ready ->
#Add new project
  $('#addNewProject').editable
    value : '',
    display: false,
    mode: 'popup',
    validate: (value)->
      if value.length > 255
        return 'Name is too long. Maximum 255 characters'
      if !value
        return 'Name can\'t be blank'
    url: (value)->
      $.ajax {
        type: 'post',
        url: '/projects/create',
        data: {project_name: value}
      }
####
#Edit project
  $(document).on 'mousemove',->
    $('.projectName').editable
      mode: 'inline',
      validate: (value)->
        $('.editable-input').tooltip('destroy')
        if value.length > 255
          $('.editable-input').tooltip(title: 'Name is too long. Maximum 255 characters', placement: 'left')
          return ' '
        if !value
          $('.editable-input').tooltip(title: 'Name can\'t be blank', placement: 'left')
          return ' '
      url: ->
        $.ajax {
          type: 'put',
          url: '/projects/update',
          data: {id: $(this).closest('.project').attr("id"), new_value: $('.input-sm').val() }
        }

  $('.projectName').off('click')

  $(document).on 'click', '.editProject', (e)->
    e.stopPropagation()
    $(this).closest('.row').find('.projectName').editable 'toggle'

  $('.projectName').on 'hidden', (e, reason) ->
    $(this).off('click')
####