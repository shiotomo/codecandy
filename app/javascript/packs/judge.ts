import { JudgeCompiler } from '../lib/compiler/judge-compiler';
import { AceEditor } from '../lib/editor/ace-editor.ts'

const aceEditor: AceEditor = new AceEditor();
const answerElement: HTMLInputElement = document.getElementById('answer_id') as any;
const runButton: HTMLInputElement = document.getElementById('run_button') as any;
const judgeButton: HTMLInputElement = document.getElementById('judge_button') as any;

// 実行ボタンがクリックされた時
runButton.onclick = () => {
  const languageElement: HTMLInputElement = document.getElementById('language') as any;
  const language: string = languageElement.value;
  const sourceCode: string = aceEditor.getValue();
  const input: string = document.getElementById('input').textContent;
  const judgeCompiler: JudgeCompiler = new JudgeCompiler(language, sourceCode, input, '');
  judgeCompiler.runCode();
};

// 解答ボタンがクリックされた時
judgeButton.onclick = () => {
  if (!window.confirm('現在のプログラムで解答してもよいですか？')) {
    return;
  }
  const languageElement: HTMLInputElement = document.getElementById('language') as any;
  const language: string = languageElement.value;
  const sourceCode: string = aceEditor.getValue();
  const input: string = document.getElementById('input').textContent;
  const judgeCompiler: JudgeCompiler = new JudgeCompiler(language, sourceCode, '', answerElement.value);
  judgeCompiler.judgeCode();
};
