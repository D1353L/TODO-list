$(document).ready ->
#Events for Add new project form
  $('#addProject_form').hide()
  $('#addProject').on "click", ->
    $(this).hide()
    $('#addProject_form').toggle()

  $('#addProject, #addNewProject').on "click", ->
    $('html, body').animate({ scrollTop: $(document).height() }, 1500)

#Hide project options
  $(document).on 'mouseover', '.projectHead', ->
    $(this).find('.projectOptions').show()
  $(document).on 'mouseout', '.projectHead', ->
    $(this).find('.projectOptions').hide()

#Enable Edit project form
  $.fn.editable.defaults.mode = 'inline'
  $('#projectName').editable 'disable', {
    type: 'text',
    url: '/projects/update',
    pk: 1,
    placement: 'top',
    title: 'Enter public name'
  }
  $(document).on 'click', '.editProject', (e)->
    e.stopPropagation()
    $(this).closest('.row').find('#projectName').editable 'enable'
    $(this).closest('.row').find('#projectName').editable 'toggle'
  $('#projectName').on 'hidden', (e, reason) ->
    $(this).editable 'disable'
