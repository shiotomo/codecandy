import { Ace } from 'ace-builds';

export class AceEditor {
  readonly aceEditor = ace.edit('source_code');

  constructor() {
    // 初期値を設定する
    this.aceEditor.$blockScrolling = Infinity;
    this.aceEditor.setOptions({
      enableBasicAutocompletion: true,
      enableLiveAutocompletion: true,
      enableSnippets: true,
      fontSize: '12pt'
    });
    this.aceEditor.setTheme('ace/theme/monokai');
    this.aceEditor.getSession().setMode('ace/mode/c_cpp');
    this.aceEditor.getSession().setTabSize(4);
  }

  /**
   * エディタに書き込まれている値を返却する
   */
  getValue(): string {
    return this.aceEditor.getValue();
  }

  /**
   * エディタに値を書き込む
   */
  setValue(text: string) {
    this.aceEditor.setValue(text);
  }

  /**
   * エディタのモードを切り替える
   */
  setEditorLanguage(language: string) {
    fetch(`/api/v1/language/information/${language}/mode`, {
      method: 'GET',
      credentials: "include",
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': document.getElementsByName('csrf-token').item(0)['content']
      }
    }).then(response => {
      return response.json();
    }).then(result => {
      const mode = result['data'];
      this.aceEditor.getSession().setMode("ace/mode/" + mode);

      // エディタ上にデフォルト値を設定する
      // インデントまで全て値にみなされるのでインデントをずらさない
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
      return result;
    }).catch(err => {
      alert('エラーが発生しました');
    });
  }

  /**
   * エディタのタブサイズを設定する
   */
  setEditorTab(language: string) {
    fetch(`/api/v1/language/information/${language}/tab`, {
      method: 'GET',
      credentials: "include",
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': document.getElementsByName('csrf-token').item(0)['content']
      }
    }).then(response => {
      return response.json();
    }).then(result => {
      this.aceEditor.getSession().setTabSize(result['data']);
      return result;
    }).catch(err => {
      alert('エラーが発生しました');
    });
  }
}
