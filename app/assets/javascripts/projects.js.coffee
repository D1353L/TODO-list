$(document).ready ->
  $('#addProject_form').hide()
  $("#addProject").on "click", ->
    $(this).hide()
    $('#addProject_form').toggle()
    return
  $("#addProject, #addNewProject").on "click", ->
    $("html, body").animate({ scrollTop: $(document).height() }, 1500)
    return
  return