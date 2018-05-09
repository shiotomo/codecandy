// AceEditor
var aceEditor = ace.edit("source_code");

aceEditor.$blockScrolling = Infinity;

aceEditor.setOptions({
  enableBasicAutocompletion: true,
  enableLiveAutocompletion: true,
  enableSnippets: true,
  fontSize: "12pt"
});

// テーマ
aceEditor.setTheme("ace/theme/monokai");
// タブ幅を2にする
aceEditor.getSession().setTabSize(2);

$('#run_button').on("click", () => {
  runCode();
});

$('#judge_button').on("click", () => {
  if (window.confirm("現在のプログラムで解答してもよいですか？")) {
    judgeCode();
  }
});

function setEditorLanguage(language) {
  var languageToMode = {
    ruby: 'ruby',
    python: 'python',
    c: 'c_cpp',
  };
  var mode =languageToMode[language];
  aceEditor.getSession().setMode("ace/mode/" + mode);
}

$('#language').val('ruby');
setEditorLanguage('ruby');
$('#language').on("change", (e) => {
  setEditorLanguage(this.value);
});

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
