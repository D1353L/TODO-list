$(document).ready ->
  $('#addProject_form').hide()
  $("#addProject").on "click", ->
    $(this).hide()
    $('#addProject_form').toggle()
    return
  return