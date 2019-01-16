import { RunCompiler } from '../lib/compiler/run-compiler';
import { AceEditor } from '../lib/editor/ace-editor.ts'

const aceEditor: AceEditor = new AceEditor();
const runButton: HTMLInputElement = document.getElementById('run_button') as any;

runButton.onclick = () => {
  const languageElement: HTMLInputElement = document.getElementById('language') as any;
  const language: string = languageElement.value;
  const sourceCode: string = aceEditor.getValue();
  const input: string = (document.getElementById('input') as any).value;
  const runCompiler: RunCompiler = new RunCompiler(language, sourceCode, input, '');
  runCompiler.runCode();
};
