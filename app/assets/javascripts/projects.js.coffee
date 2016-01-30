$(document).ready ->
#Add new project
  $('span4 .editable-submit').on "click", ->
    $('html, body').animate({ scrollTop: $(document).height() }, 1500)

  $('#addNewProject').editable
    value : '',
    display: false,
    mode: 'popup',
    validate: (value)->
      if !value
        return "Name can't be blank"
    url: (value)->
      $.ajax {
        type: 'post',
        url: '/projects/create',
        data: {project_name: value}
      }
####

#Hide/show project options
  $(document).on 'mouseover', '.projectHead', ->
    $(this).find('.projectOptions').show()
  $(document).on 'mouseout', '.projectHead', ->
    $(this).find('.projectOptions').hide()
####

#Edit project
  $(document).on 'mousemove',->
    $('.projectName').editable
      mode: 'inline',
      validate: (value)->
        if !value
          return "Name can't be blank"
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