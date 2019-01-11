import { Compiler } from '../lib/compiler';
import { Editor } from '../lib/editor';

const aceEditor = ace.edit('source_code');
console.log(typeof aceEditor);
// const editor = new Editor(aceEditor);

document.getElementById('run_button').onclick = () => {
  const language = document.getElementById('language').textContent;
  const sourceCode = aceEditor.getValue();
  const input = document.getElementById('input').textContent;
  const compiler = new Compiler(language, sourceCode, input);
  compiler.runCode();
};

document.getElementById('judge_button').onclick = () => {
  const language = document.getElementById('language').textContent;
  const sourceCode = aceEditor.getValue();
  const input = document.getElementById('input').textContent;
  const compiler = new Compiler(language, sourceCode, input);
  compiler.judgeCode();
};
