// AceEditor
const aceEditor = ace.edit("source_code");

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
    Python3: 'python',
    Gcc: 'c_cpp',
    Clang: 'c_cpp',
    Nodejs: 'javascript',
    Golang: 'golang',
    Java: 'java',
    Scala: 'scala',
    Swift: 'swift',
    CPP: 'c_cpp',
    PHP: 'php',
    Perl: 'perl',
    Bash: 'sh'
  };
  const mode = languageToMode[language];
  aceEditor.getSession().setMode("ace/mode/" + mode);

  if (mode=='java' && aceEditor.getValue() == '') {
    aceEditor.setValue(
`public class Main {
    public static void main(String[] args) {
        
    }
}`);
  }
  if (mode=='scala' && aceEditor.getValue() == '') {
    aceEditor.setValue(
`object Main {
  def main(args: Array[String]) {
    
  }
}`);
  }
}

$('#language').on("change", (e) => {
  setEditorLanguage($('select').val());
  switch ($('select').val()) {
    case "Nodejs":
    case "Ruby":
    case "Scala":
    case "Bash":
      aceEditor.getSession().setTabSize(2);
      break;
    case 'Python3':
    case 'Gcc':
    case 'Clang':
    case 'Java':
    case 'Swift':
    case 'CPP':
    case 'PHP':
    case 'Perl':
      aceEditor.getSession().setTabSize(4);
      break;
    case 'Golang':
      aceEditor.getSession().setTabSize('tab');
      break;
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
    Bash: 'sh'
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
