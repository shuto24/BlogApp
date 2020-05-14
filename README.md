# README
アプリ名
BlogApp
====

## 概観
  ブログの投稿、コメント、編集、閲覧ができるアプリです。

## 説明
  ユーザー登録を行わずともブログの閲覧ができるアプリです。
  また、ユーザー登録を行うことでブログの投稿、ブログに対するコメントを行うことができます。
  気になる筆者がいれば、その筆者の名前をクリックすることでそのかたの書いたブログ一覧も見ることができます。
  
## 制作意図
  Railsで初めて個人アプリを作る際に、今まで勉強してきた復習として、ユーザー登録機能、投稿機能を付けたいなと考え
  身近で自分も閲覧したことがあったブログアプリを作ろうと考えた。
  
## 使用技術(開発環境)
  Rails 5.2.4.2
  ruby 2.5.1
  mysql  Ver 14.14
  heroku/7.40.0

## Demo
新規投稿機能
[![Image from Gyazo](https://i.gyazo.com/8357fd817bb3d2b91569ea06bdfd9029.gif)](https://gyazo.com/8357fd817bb3d2b91569ea06bdfd9029)
コメント機能
[![Image from Gyazo](https://i.gyazo.com/ec79e5da08ed26be14709637730da40a.gif)](https://gyazo.com/ec79e5da08ed26be14709637730da40a)


## 使用方法
 テストアカウント    email  test@test  password   000000  こちらからログインできます。
  https://floating-garden-29395.herokuapp.com/
  を開いて投稿一覧を確認することができます。
  headerの新規会員登録から登録していただいて新規投稿からブログの投稿ができます。
  headerの左上Blogを押すとrootに戻れます。
  rootのブログ一覧のタイトルから詳細に飛ぶことができ、コメントを送ることができます。
  また、一覧の筆者の名前をクリックすることでそのかたの書いたブログ一覧を閲覧することができます。

## 課題
  現在は、投稿が空白でも投稿ボタンが押せて、投稿はされないようになっているため、各項目の下に『〇〇を入力してください』と出てくるようにしたい。
  また、各場所でエラーが出た際のエラーハンドリングが設定されていないため、エラーが出る可能性がある場所を探し設定していきたい
  投稿一覧、コメントがサイト自体を更新しないと更新されないようになっているため、jsで非同期通信を行い自然に更新されるようにしていきたい。
  新規投稿で画像を投稿できるようにする。
  
## DB設計
  ## commentsテーブル

  |Column|Type|Options|
  |------|----|-------|
  |user_id|references|null: false, foreign_key: true|
  |post_id|references|null: false, foreign_key: true|
  |text|text|null: false, unique: true|
  |created_at|datetime |null: false|
  |updated_at|datetime |null: false|

  ### Association
  - belongs_to :post
  - belongs_to :user

  ## postsテーブル

  |Column|Type|Options|
  |------|----|-------|
  |user_id|references|null: false, foreign_key: true|
  |title|text|null: false, unique: true|
  |content|text|null: false|
  |image|string|
  |created_at|datetime |null: false|
  |updated_at|datetime |null: false|

  ### Association
  - belongs_to :user
  - has_many   :comments
  
  ## usersテーブル

  |Column|Type|Options|
  |------|----|-------|
  |nickname|string|null: false, unique: true|
  |email|string|null: false|
  |encrypted_password|string|null: false|
  |reset_password_token|string|
  |reset_password_sent_at|datetime |
  |remember_created_at|datetime |
  |created_at|datetime |null: false|
  |updated_at|datetime |null: false|
  
  ### Association
  - has_many :posts
  - has_many :comments
