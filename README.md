# アプリケーション名
Smart fridge

# アプリケーション概要
冷蔵庫の食材などを一元管理して食品ロスを減らしたり、残量に応じて買い物リストを自動作成してくれる。また複数人で同じ冷蔵庫を共有することができる。

# URL
https://smart-fridge-2022.herokuapp.com/

# テスト用アカウント
Basic認証ユーザー名:admin  
Basic認証パスワード:3966  
メールアドレス:test@test  
パスワード：111aaa

# 利用方法
### アイテム管理機能
1. トップページのヘッダーよりユーザー新規登録を行う
2. 新規冷蔵庫を作成するか、既存の共有したい冷蔵庫IDを記述し共有リクエストを申請する
3. 常備チェック、名前、カテゴリ、残量、賞味/消費期限（任意）を入力し、新規アイテム（食品等）を登録する。
4. 冷蔵庫内の登録したアイテムが一覧表示される。一覧表示画面から残量などの情報は編集可能。削除もできる。

### お買い物機能
1. トップページのヘッダーより「お買い物に行く」ボタンをクリックするとお買い物ページに遷移する
2. 残量がないアイテム、常備チェックがついてるアイテム順に買い物リストが表示される
3. 買い物するアイテムにチェックをつけ、買い物を終了するボタンを押すとトップページに遷移する
4. 買い物したアイテムの残量は補充され、賞味/消費期限はリセットされる

### 通知ボード機能
トップページにある通知ボードをクリックすると通知領域が展開される
- 冷蔵庫の共有リクエストが届いていたら表示。承認・拒否ボタンできめることができる
- 賞味/消費期限アラートが表示される。当日のものと過ぎているものに関して表示される
- 共有している冷蔵庫の別のユーザーが買い物した際に通知がされる。買い物をクリックすると買い物したアイテムの詳細が見れる

# アプリケーションを作成した背景
友人のヒアリングや自身の悩みから作成。
- 賞味期限や消費期限を忘れ食品をロスにしてしまう
- 冷蔵庫内の食品を忘れ、ロスにしてしまう
- 買い物に行っても買い忘れをしてしまうことがある
- 同居人と冷蔵庫をシェアしているが管理が難しい
などの問題を発見。

このことから食品などを一括管理し、同居人と共有でき、賞味/消費期限のアラートが出て、買い物リストを自動作成する機能を持つアプリケーションと要件を定義した。
また間接的にはあるが、世界でも高止まりする日本のフードロス量の減少に貢献できればと思い開発に着手した。

# 洗い出した要件
https://docs.google.com/spreadsheets/d/1At8OcO7O88HiHbrIGCK__cesZWE8LmJn6NpBly7E9Qs/edit#gid=982722306

# 実装した機能についての画像やGIFおよびその説明

- 冷蔵庫作成・共有機能
- アイテム管理機能
- お買い物機能
- 通知ボード機能

# 実装予定の機能

- フードロスカウント機能（ランク機能)

# データベース設計
[![Image from Gyazo](https://i.gyazo.com/1585b6eb71606463d192327e4ba75828.png)](https://gyazo.com/1585b6eb71606463d192327e4ba75828)

# 画面遷移図
[![Image from Gyazo](https://i.gyazo.com/70beb19fa789902756188d16ccdfb257.png)](https://gyazo.com/70beb19fa789902756188d16ccdfb257)

# 開発環境
- Ruby 2.6.5
- Ruby on Rails 6.0.0 
- MySQL 5.6.51
- Bootstrap 
- Github
- Visual Studio Code

# ローカルでの動作方法
以下のコマンドを順に実行  
% git clone https://github.com/key3966/smart-fridge-2022  
% cd smart-fridge-2022  
% bundle install  
% yarn install

# 工夫したポイント
便利にするためのアプリケーションなのに管理が手間になってしまっては本末転倒なので、ユーザー体験を重要視して実装した。  
- 具体的には画面遷移を減らし、トップページ内でできることを増やした
- 通知ボードなどは折り畳みにして一覧性を損なわないようにした

# テーブル設計

## users テーブル

| Column             | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| nickname           | string     | unique: true, null: false     |
| email              | string     | unique: true, null: false     |
| encrypted_password | string     | null: false                   |
| gender             | string     | null: false                   |
| birthday           | date       | null: false                   |
| fridge             | references | null: true, foreign_key: true |

### Association

- belongs_to :fridge
- has_many :shoppings
- has_one :request

## fridges テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| title  | string |             |

### Association

- has_many :users
- has_many :items
- has_many :shoppings
- has_many :requests

## items テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| regular          | integer    | null: false                    |
| name             | string     | null: false                    |
| category_id      | integer    | null: false                    |
| amount_id        | integer    | null: false                    |
| exp_date         | date       | null: false                    |
| fridge           | references | null: false, foreign_key: true |

### Association

- belongs_to :fridge
- has_many :losses
- has_many :shoppings
- has_many :shopping_items

## shoppings テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| shopping_date    | date       | null: false                    |
| fridge           | references | null: false, foreign_key: true |
| user             | references | null: false, foreign_key: true |

### Association

- belongs_to :fridge
- belongs_to :user
- has_many :items
- has_many :shopping_items 

## shopping_items テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| shopping      | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |

### Association

- belongs_to :shopping
- belongs_to :item

## losses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| loss_date     | date       | null: false                    |
| fridge        | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |

### Association

- belongs_to :fridge
- belongs_to :item

## requests テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| fridge        | references | null: false, foreign_key: true |
| user          | references | null: false, foreign_key: true |

### Association

- belongs_to :fridge
- belongs_to :user