import { Compiler } from './compiler';

export class JudgeCompiler extends Compiler {
  constructor (language: string, sourceCode: string, input: string, questionId: string) {
    super(language, sourceCode, input, questionId);
  }

  runCode() {
    this.runButton.innerHTML = '実行中';
    this.runButton.disabled = true;
    this.judgeButton.disabled = true;

    fetch('/api/v1/compile/exec', {
      method: 'POST',
      credentials: "include",
      body: JSON.stringify(this.data),
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': document.getElementsByName('csrf-token').item(0)['content']
      }
    }).then(response => {
      return response.json();
    }).then(result => {
      this.stdout.innerHTML = result.stdout
      this.stderr.innerHTML = result.stderr
      this.time.innerHTML = result.time
      this.exitCode.innerHTML = result.exit_code
      this.answer.innerHTML = '';
      return result;
    }).catch(err => {
      // console.log(err);
      alert('エラーが発生しました');
    })
    .then(() => {
      this.runButton.disabled = false;
    this.judgeButton.disabled = false;
      this.runButton.innerHTML = '実行';
    });
  }

  judgeCode() {
    this.judgeButton.innerHTML = '判定中';
    this.runButton.innerHTML = '実行中';
    this.judgeButton.setAttribute('disabled', 'disabled');
    this.runButton.setAttribute('disabled', 'disabled');

    fetch('/api/v1/judgement/exec', {
      method: 'POST',
      credentials: "include",
      body: JSON.stringify(this.data),
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': document.getElementsByName('csrf-token').item(0)['content']
      }
    }).then(response => {
      return response.json();
    }).then(result => {
      if (result.input_error) {
        this.stdout.innerHTML = result.stdout;
        this.stderr.innerHTML = result.stderr;
        this.time.innerHTML = result.time;
        this.exitCode.innerHTML = result.exit_code;
        this.answer.innerHTML = result.answer;
      } else {
        this.stdout.innerHTML = '';
        this.stderr.innerHTML = '';
        this.time.innerHTML = '';
        this.exitCode.innerHTML = '';
        this.answer.innerHTML = result.answer;
      }
    }).catch(err => {
      // console.log(err);
      alert('エラーが発生しました');
    })
    .then(() => {
      this.judgeButton.disabled = false;
      this.judgeButton.innerHTML = '解答';
      this.runButton.disabled = false;
      this.runButton.innerHTML = '実行';
    });
  }
}
