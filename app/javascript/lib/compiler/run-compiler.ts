import { Compiler } from './compiler';

export class RunCompiler extends Compiler {
  constructor (language: string, sourceCode: string, input: string, answerId: string) {
    super(language, sourceCode, input, answerId);
  }

  runCode() {
    this.runButton.innerHTML = '実行中';
    this.runButton.disabled = true;

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
      alert('エラーが発生しました');
    }).then(() => {
      this.runButton.disabled = false;
      this.runButton.innerHTML = '実行';
    });
  }
}
