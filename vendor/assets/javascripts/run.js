function runCode() {
  $('#run_button').text("実行中").prop('disabled', true);

  const language = $('#language').val();
  const source_code = aceEditor.getValue();
  const input = $('#input').val();

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
    $('#answer').text("");
    $('#run_button').text("実行").prop('disabled', false);
  }).fail(err => {
    alert('エラーが発生しました');
    $('#run_button').text("実行").prop('disabled', false);
  });
}

function judgeCode() {
  $('#judge_button').text("判定中").prop('disabled', true);

  const language = $('#language').val();
  const source_code = aceEditor.getValue();
  const answer_id = $('#answer_id').val();

  $.ajax({
    url: '/api/v1/judgement/exec',
    method: 'post',
    data: {
      language,
      source_code,
      answer_id
    }
  }).done(result => {
    $('#stdout').text("");
    $('#stderr').text("");
    $('#time').text("");
    $('#exit_code').text("");
    $('#answer').text(result.answer);
    $('#judge_button').text("解答").prop('disabled', false);
  }).fail(err => {
    alert('エラーが発生しました');
    $('#judge_button').text("解答").prop('disabled', false);
  });
}
