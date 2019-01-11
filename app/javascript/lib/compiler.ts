export class Compiler {
  private data: {
    language: string;
    source_code: string;
    input: string;
  };
  private stdout = document.getElementById('stdout');
  private stderr = document.getElementById('stderr');
  private time = document.getElementById('time');
  private exitCode = document.getElementById('exit_code');
  private answer = document.getElementById('answer');
  private runButton = document.getElementById('run_button') as any;
  private judgeButton = document.getElementById('judge_button') as any;

  public constructor (language: string, sourceCode: string, input: string) {
    this.data = {
      language,
      source_code: sourceCode,
      input
    }
  }

  public runCode(): void {
    console.log(this.runButton);
    console.log(this.runButton.disabled);
    this.runButton.value = '実行中';
    this.runButton.disabled = true;
    console.log(this.runButton);
    console.log(this.runButton.disabled);

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
      return result;
    }).catch(err => {
      console.log(err);
      alert('エラーが発生しました');
    });

    this.runButton.disabled = false;
    this.runButton.value = '実行';
  }

  public judgeCode(): void {
    this.judgeButton.value = '判定中';
    this.runButton.value = '判定中';
    this.judgeButton.setAttribute('disabled', 'disabled');
    this.runButton.setAttribute('disabled', 'disabled');

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
      alert('エラーが発生しました');
    });

    this.judgeButton.removeAttribute('disabled');
    this.judgeButton.innerHTML = '解答';
    this.runButton.removeAttribute('disabled');
    this.runButton.innerHTML = '実行';
  }
}
