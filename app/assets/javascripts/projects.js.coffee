$(document).ready ->
  $('#addProject_form').hide()
  $('#addProject').on "click", ->
    $(this).hide()
    $('#addProject_form').toggle()
    return

  $('#addProject, #addNewProject').on "click", ->
    $('html, body').animate({ scrollTop: $(document).height() }, 1500)
    return

  $(document).on 'mouseover', '.projectHead', ->
    $(this).find('.projectOptions').show()

  $(document).on 'mouseout', '.projectHead', ->
    $(this).find('.projectOptions').hide()
  return