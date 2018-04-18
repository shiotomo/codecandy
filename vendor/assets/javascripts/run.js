function runCode() {
  $('#run_button').text("実行中").prop('disabled', true);

  var language = $('#language').val();
  var source_code = aceEditor.getValue();
  var input = $('#input').val();

  $.ajax({
    url: '127.0.0.1:3000/api/v1/compile',
    method: 'post',
    data: {
      language,
      source_code,
      input
    }
  }).done(result => {
    $('#stdout').text(result.stdout);
    $('#stderr').text(result.stderr);
    $('#time').text(result.time);
    $('#exit_code').text(result.exit_code);
    $('#run_button').text("実行").prop('disabled', false);
  }).fail(err => {
    alert('Request Faild: ' + err);
    $('#run_button').text("実行").prop('disabled', false);
  });
}
