import { RunCompiler } from '../lib/compiler/run-compiler';
import { Ace } from 'ace-builds';

// console.log(typeof ace.edit('source_code'));
// console.log(ace);

const aceEditor: object = ace.edit('source_code');
const runButton: HTMLInputElement = document.getElementById('run_button') as any;

runButton.onclick = () => {
  const languageElement: HTMLInputElement = document.getElementById('language') as any;
  const language: string = languageElement.value;
  const sourceCode: string = ace.edit('source_code').getValue(); // aceEditor.getValue();
  const input: string = document.getElementById('input').textContent;
  const runCompiler: RunCompiler = new RunCompiler(language, sourceCode, input, '');
  runCompiler.runCode();
};
