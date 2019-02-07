import { AdminTwitter } from '../lib/twitter/admin-twitter';

function tweet() {
  const tweetButton: HTMLInputElement = document.getElementById('tweet-submit') as any;

  tweetButton.onclick = () => {
    const tweetType: HTMLInputElement = document.getElementById('tweet-type') as any;
    const tweetBody: HTMLInputElement = document.getElementById('tweet-body') as any;
    const adminTwitter: AdminTwitter = new AdminTwitter(tweetType.value, tweetBody.value);
    adminTwitter.tweetRequest();
  }
}

window.addEventListener('load', () => tweet());
