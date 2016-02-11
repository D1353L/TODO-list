$(document).ready ->
#Validation
  $(document).on 'click', '.user-button', (e)->
    email = $('#user_email.form-control')
    password = $('#user_password.form-control')
    passwordConfirm = $('#user_password_confirmation.form-control')
    emailRegex = /^([a-z\d!#$%&'*+\-\/=?^_`{|}~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]+(\.[a-z\d!#$%&'*+\-\/=?^_`{|}~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]+)*|"((([ \t]*\r\n)?[ \t]+)?([\x01-\x08\x0b\x0c\x0e-\x1f\x7f\x21\x23-\x5b\x5d-\x7e\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|\\[\x01-\x09\x0b\x0c\x0d-\x7f\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))*(([ \t]*\r\n)?[ \t]+)?")@(([a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|[a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF][a-z\d\-._~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]*[a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])\.)+([a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|[a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF][a-z\d\-._~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]*[a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])\.?$/i
    valid = true

    email.tooltip('destroy')
    email.closest('div').removeClass('has-error')
    password.tooltip('destroy')
    password.closest('div').removeClass('has-error')
    passwordConfirm.tooltip('destroy')
    passwordConfirm.closest('div').removeClass('has-error')

    #Email
    if email.val().length > 100
      email.tooltip(title: 'Email is too long. Maximum 100 characters', placement: 'left')
      email.closest('div').addClass('has-error')
      valid = false
    else
      if !email.val()
        email.tooltip(title: 'Email can\'t be blank', placement: 'left')
        email.closest('div').addClass('has-error')
        valid = false
      else
        if !emailRegex.test(email.val())
          email.tooltip(title: 'Email has invalid format', placement: 'left')
          email.closest('div').addClass('has-error')
          valid = false

    #Password
    if password.val().length > 100
      password.tooltip(title: 'Password is too long. Maximum 100 characters', placement: 'left')
      password.closest('div').addClass('has-error')
      valid = false
    else
      if !password.val()
        password.tooltip(title: 'Password can\'t be blank', placement: 'left')
        password.closest('div').addClass('has-error')
        valid = false
      else
        if password.val().length < 8
          password.tooltip(title: 'Password is too short. Minimum 8 characters', placement: 'left')
          password.closest('div').addClass('has-error')
          valid = false

    #Password confirmation
    if passwordConfirm.length > 0 && passwordConfirm.val() != password.val() && password.val()
      passwordConfirm.tooltip(title: 'Password confirmation doesn\'t match ', placement: 'left')
      passwordConfirm.closest('div').addClass('has-error')
      valid = false

    return valid
####