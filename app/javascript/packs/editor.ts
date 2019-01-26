import { AceEditor } from '../lib/editor/ace-editor.ts'

const aceEditor: AceEditor = new AceEditor();

const saveButton: HTMLInputElement = document.getElementById('save_button') as any;
const loadButton: HTMLInputElement = document.getElementById('load_button') as any;
const loadFile: HTMLInputElement = document.getElementById('load_file') as any;
const languageElement: HTMLInputElement = document.getElementById('language') as any;

// セーブボタンが押された時
saveButton.onclick = (e: Event) => {
  fetch(`/api/language/information/${languageElement.value}/extension`, {
    method: 'GET',
    credentials: "include",
    headers: {
      'Content-Type': 'application/json',
      'X-CSRF-Token': document.getElementsByName('csrf-token').item(0)['content']
    }
  }).then(response => {
    return response.json();
  }).then(result => {
    console.log(result['data']);
    const extension = result['data']
    const date = new Date();
    const blob = new Blob([aceEditor.getValue()], { type:'text/plain' });
    const a = Object.assign(document.createElement('a'), {
      href:URL.createObjectURL(blob),
      target:'_blank',
      download: date.toLocaleDateString().replace(/\//g, '_') + `.${extension}`
    });
    document.body.appendChild(a);
    a.click();
    a.parentNode.removeChild(a);
    return result;
  }).catch(err => {
    alert('エラーが発生しました');
  });
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
  aceEditor.setEditorTab(languageElement.value);
  aceEditor.setEditorLanguage(languageElement.value);
}
