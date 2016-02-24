att_id = <%= JSON.generate @attempt.id %>
user_id = <%= JSON.generate current_user.id %>
is_coding = <%= JSON.generate @exercise.is_coding? %>
$("#exercisefeedback").show()

if is_coding
  $("#saved_assurance").html("Your answer has been saved.  You can move on to another exercise if you don't want to wait for more feedback.")
  $(".btn-submit").attr('disabled', 'disabled')
  $("#exercisefeedback").html('<h2>Feedback</h2><i class="fa fa-spinner fa-spin fa-2x"></i>')
  setTimeout ( ->
    $.ajax(url: "/sse/feedback_poll?att_id=#{att_id}")
  ), 1500
else
  $.ajax(url: "/sse/feedback_poll?att_id=#{att_id}")
