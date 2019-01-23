export class Compiler {
  readonly data: {
    language: string;
    source_code: string;
    input: string;
    question_id: string;
  };
  readonly stdout = document.getElementById('stdout');
  readonly stderr = document.getElementById('stderr');
  readonly time = document.getElementById('time');
  readonly exitCode = document.getElementById('exit_code');
  readonly answer = document.getElementById('answer');
  readonly runButton = document.getElementById('run_button') as any;
  readonly judgeButton = document.getElementById('judge_button') as any;

  constructor (language: string, sourceCode: string, input: string, questionId: string) {
    this.data = {
      language,
      source_code: sourceCode,
      input,
      question_id: questionId
    };
  }
}
