function runCode() {
  $('#run_button').text("実行中").prop('disabled', true);

  var language = $('#language').val();
  var source_code = aceEditor.getValue();
  var input = $('#input').val();

  console.log("==========>");
  console.log(language);
  console.log(source_code);
  console.log(input);

  $.ajax({
    url: 'api/v1/compile/exec',
    method: 'post',
    data: {
      language,
      source_code,
      input
    }
  }).done(result => {
    console.log(result);
    $('#stdout').text(result.stdout);
    $('#stderr').text(result.stderr);
    $('#time').text(result.time);
    $('#exit_code').text(result.exit_code);
    $('#run_button').text("実行").prop('disabled', false);
  }).fail(err => {
    console.log("==========>");
    console.log(err);
    alert('Request Faild: ' + err);
    $('#run_button').text("実行").prop('disabled', false);
  });
}
