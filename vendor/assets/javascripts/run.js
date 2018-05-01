function runCode() {
  $('#run_button').text("実行中").prop('disabled', true);

  var language = $('#language').val();
  var source_code = aceEditor.getValue();
  var input = $('#input').val();

  $.ajax({
    url: '/api/v1/compile/exec',
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
    alert('エラーが発生したました');
    $('#run_button').text("実行").prop('disabled', false);
  });
}

function judgeCode() {
  $('#judge_button').text("判定中").prop('disabled', true);
  console.log("piyo");

  var language = $('#language').val();
  var source_code = aceEditor.getValue();
  var answer_id = $('#id').val();

  $.ajax({
    url: '/api/v1/judgement/exec',
    method: 'post',
    data: {
      language,
      source_code,
      answer_id
    }
  }).done(result => {
    $('#answer').text(result.answer);
    $('#judge_button').text("解答").prop('disabled', false);
  }).fail(err => {
    alert('エラーが発生したました');
    $('#judge_button').text("解答").prop('disabled', false);
  });
}
