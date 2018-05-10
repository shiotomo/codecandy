// AceEditor
var aceEditor = ace.edit("source_code");

aceEditor.$blockScrolling = Infinity;
aceEditor.getSession().setMode("ace/mode/c_cpp");

aceEditor.setOptions({
  enableBasicAutocompletion: true,
  enableLiveAutocompletion: true,
  enableSnippets: true,
  fontSize: "12pt"
});

// テーマ
aceEditor.setTheme("ace/theme/monokai");
// タブ幅を2にする
aceEditor.getSession().setTabSize(4);

function setEditorLanguage(language) {
  const languageToMode = {
    Ruby: 'ruby',
    Python: 'python',
    C: 'c_cpp',
  };
  const mode = languageToMode[language];
  aceEditor.getSession().setMode("ace/mode/" + mode);
}

$('#language').on("change", (e) => {
  setEditorLanguage($('select').val());
  if ($('select').val() == "Ruby") {
    aceEditor.getSession().setTabSize(2);
  }
});

$('#run_button').on("click", () => {
  runCode();
});

$('#judge_button').on("click", () => {
  if (window.confirm("現在のプログラムで解答してもよいですか？")) {
    judgeCode();
  }
});

// ファイルから呼び出す
$('#load_file').on('change', (e) => {
  const { target } = e;
  const { files } = target;

  const reader = new FileReader();
  reader.readAsText(files[0]);
  reader.onload = function(){
    aceEditor.setValue(reader.result, -1);
  };
});

$('#load_button').on('click', (e) => {
  $('#load_file').click();
});

// ファイルに保存する
$('#save_button').on('click', (e) => {
  const extension = {
    Ruby: 'rb',
    Python: 'py',
    C: 'c',
  };

  const date = new Date();
  const blob = new Blob([aceEditor.getValue()], { type:'text/plain' });
  const a = Object.assign(document.createElement('a'), {
    href:URL.createObjectURL(blob),
    target:'_blank',
    download: date.toLocaleDateString().replace(/\//g, '_') 
                                        + `.${extension[$('#language').val()]}`
  })
  document.body.appendChild(a);
  a.click();
  a.parentNode.removeChild(a);
});
