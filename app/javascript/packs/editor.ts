import { AceEditor } from '../lib/editor/ace-editor.ts'

const aceEditor: AceEditor = new AceEditor();

const saveButton: HTMLInputElement = document.getElementById('save_button') as any;
const loadButton: HTMLInputElement = document.getElementById('load_button') as any;
const loadFile: HTMLInputElement = document.getElementById('load_file') as any;
const languageElement: HTMLInputElement = document.getElementById('language') as any;

// セーブボタンが押された時
saveButton.onclick = (e: Event) => {
  const languageElement: HTMLInputElement = document.getElementById('language') as any;
  const extension = {
    Ruby: 'rb',
    Python3: 'py',
    Gcc: 'c',
    Clang: 'c',
    Nodejs: 'js',
    Golang: 'go',
    Java: 'java',
    Scala: 'scala',
    Swift: 'swift',
    CPP: 'cpp',
    PHP: 'php',
    Perl: 'pl',
    Bash: 'sh',
    Lua: 'lua',
    Haskell: 'hs',
    Pascal: 'pas'
  };

  const date = new Date();
  const blob = new Blob([aceEditor.getValue()], { type:'text/plain' });
  const a = Object.assign(document.createElement('a'), {
    href:URL.createObjectURL(blob),
    target:'_blank',
    download: date.toLocaleDateString().replace(/\//g, '_')
                                        + `.${extension[languageElement.value]}`
  });
  document.body.appendChild(a);
  a.click();
  a.parentNode.removeChild(a);
}

// ロードボタンが押された時
loadButton.onclick = () => {
  loadFile.click();
}

loadFile.onchange = (e: Event) => {
  const { target } = e as any;
  const { files } = target;

  const reader = new FileReader();
  reader.readAsText(files[0]);
  reader.onload = () => {
    aceEditor.setValue(reader.result.toString());
  };
}

// 利用言語が変わった時
languageElement.onchange = () => {
  aceEditor.setEditorLanguage(languageElement.value);
}
