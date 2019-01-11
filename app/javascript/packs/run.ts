import { Compiler } from '../lib/compiler';
import { Ace } from 'ace-builds';

console.log(typeof ace.edit('source_code'));
console.log(ace);

const aceEditor: object = ace.edit('source_code');

document.getElementById('run_button').onclick = () => {
  const languageElement: HTMLInputElement = document.getElementById('language') as any;
  const language: string = languageElement.value;
  const sourceCode: string = ace.edit('source_code').getValue(); // aceEditor.getValue();
  const input: string = document.getElementById('input').textContent;
  const compiler: Compiler = new Compiler(language, sourceCode, input);
  compiler.runCode();
  console.log("--------------");
};
