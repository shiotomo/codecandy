# CodeCandy

## 使い方
__docker__
  
ubuntuイメージを利用します。
```
docker commit [ID] codecandy/compile
docker build -t codecandy/compile .
```

__cmd__  
git cloneした後、このリポジトリにいる状態
```
bundle install --path vendor/bundle
bundle exec rails db:create
bundle exec rails db:migrate
```
