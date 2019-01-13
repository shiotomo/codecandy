import { Ace } from 'ace-builds';

export class AceEditor {
  readonly aceEditor = ace.edit('source_code');

  constructor() {
    this.aceEditor.$blockScrolling = Infinity;
    this.aceEditor.setOptions({
      enableBasicAutocompletion: true,
      enableLiveAutocompletion: true,
      enableSnippets: true,
      fontSize: '12px'
    });
    this.aceEditor.setTheme('ace/theme/monokai');
    this.aceEditor.getSession().setMode('ace/mode/c_cpp');
    this.aceEditor.getSession().setTabSize(4);
  }

  getValue(): string {
    return this.aceEditor.getValue();
  }

  setValue(text: string) {
    this.aceEditor.setValue(text);
  }

  setEditorLanguage(language: string) {
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
      Bash: 'sh',
      Lua: 'lua',
      Haskell: 'haskell',
      Pascal: 'pascal'
    };
    const mode = languageToMode[language];
    this.aceEditor.getSession().setMode("ace/mode/" + mode);

    // エディタ上にデフォルト値を設定するのでインデントをずらさない
    if (mode=='java' && this.aceEditor.getValue() == '') {
      this.aceEditor.setValue(
`import java.util.*;

public class Main {
    public static void main(String[] args) {

    }
}`
      );
    }
    if (mode=='scala' && this.aceEditor.getValue() == '') {
      this.aceEditor.setValue(
`import java.util._

object Main {
  def main(args: Array[String]) {

  }
}`
      );
    }
  }

  setEditorTab(language: string) {
    switch (language) {
      case 'Nodejs':
      case 'Ruby':
      case 'Scala':
      case 'Bash':
      case 'Lua':
      case 'Pascal':
        this.aceEditor.getSession().setTabSize(2);
        break;
      case 'Python3':
      case 'Gcc':
      case 'Clang':
      case 'Java':
      case 'Swift':
      case 'CPP':
      case 'PHP':
      case 'Perl':
      case 'Haskell':
        this.aceEditor.getSession().setTabSize(4);
        break;
      case 'Golang':
        // TODO インデントをTabにする
        this.aceEditor.getSession().setTabSize(4);
        break;
    }
  }
}
