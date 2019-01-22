export class AdminTwitter {
  readonly tweetResultElement: HTMLInputElement = document.getElementById('tweet-result') as any;
  readonly data: {
    tweet_type: string;
    body: string;
  }

  constructor(tweetType: string, body: string) {
    this.data = {
      tweet_type: tweetType,
      body: body
    };
  }

  tweetRequest() {
    fetch('/api/admin/tweet', {
      method: 'POST',
      credentials: "include",
      body: JSON.stringify(this.data),
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': document.getElementsByName('csrf-token').item(0)['content']
      }
    }).then(response => {
      return response.json();
    }).then(result => {
      if (result['is_success']) {
        this.tweetResultElement.style.color = 'green';
      } else {
        this.tweetResultElement.style.color = 'red';
      }
      this.tweetResultElement.innerHTML = result['status'];
      return result;
    }).catch(err => {
      alert('エラーが発生しました');
    });
  }
}
