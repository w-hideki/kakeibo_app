# README

## アプリケーション名

- かけ〜ぼ

## アプリケーションの概要

- 月ごとの収入、支出、今月の収支金額の差額、全体の残高がわかる家計簿アプリ。
- シンプルな見た目で難しい収支計算を自動で表示。
- グラフにより、一月で何の、いくら収支したかが、一目瞭然。

## アプリのURL

# http://54.92.58.85/

## テスト用アカウント

# ログイン用テストユーザー
- Eメール：test@sample.com
- パスワード：111aaa

## 利用方法

# まずはアカウント登録、またはログイン

<img src="https://gyazo.com/45061e381ef47f4aac04dfaac3d72c00">

# 収入の記録

<img src="https://gyazo.com/47de2ed5b60f9067966c32deda1ec626">

# 収入の一覧が見れる

<img src="https://gyazo.com/c39e90f726aaab82592494ed4f5074f3">

# 支出の記録

<img src="https://gyazo.com/6c7634541bb0fed150162afdc0a1ad55">

# 支出の一覧が見れる

<img src="https://gyazo.com/3ddedbf8efbcc70b3649c35b1fe21a6a">

# トップページにて、今月の収支金額の差額、全体の残高が見れる
<img src="https://gyazo.com/6c33e98a6376d4ddeadd90648af589ce">

## 目指した課題解決

# どのような世代の人でも使いやすいようシンプルで、操作がわかりやすく、かつ情報が瞬時にわかること。極力、計算などで頭を使わないようにし、ユーザーに継続的にアプリを使ってもらうこと。家族で使用しても、自分以外には、記録が見られないこと。

## 洗い出した要件

# 機能１：収入、支出の一覧機能

- 目的：月ごとの収支を一眼でわかるようにするため

- 詳細：収入、支出の入力が終わると、それぞれ月ごとに一覧で見える

- ストーリー（ユースケース）：収入、または支出の入力フォームに値を入力すると、表形式でカテゴリー、日付、金額が一覧で表示される

- 見積もり（所要時間）：５時間

# 機能２：一覧表示のグラフ機能

- 目的：グラフにより、収支のカテゴリーなど、さらにわかりやすくするため

- 詳細：一覧の上に、月ごとにカテゴリーで分けられた円グラフが表示される

- ストーリー（ユースケース）：収入、または支出の入力フォームに値を入力すると、一覧の上に月ごとにカテゴリーで分けられた、円グラフが表示される

- 見積もり（所要時間）：１０時間

# 機能３：今月の収支の合計、全体の残高を表示する機能

- 目的：ユーザーにアプリを継続的に使ってもらう上で、ストレスを軽減させるため

- 詳細：トップページに、それまで入力した収入の全体の残高、今月の収支の差額が自動で表示される

- ストーリー（ユースケース）：収入と支出のデータが存在することが前提。データが存在すれば自動で、収入の全体の残高、今月の収支の差額が表示される

- 見積もり（所要時間）：３時間

# 機能４：ユーザー認証機能

- 目的：家族で使うなど、複数名で使うことを想定し、個別に見れるようにするため

- 詳細：アプリを利用するためには、新規登録、またはログインが求められる

- ストーリー（ユースケース）：アカウント登録していなければ、名前とEメール、パスワードを入力。登録していれば、Eメールとパスワードを入力してログイン。

# 見積もり（所要時間）：１時間

## データベース設計

## userテーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null :false |
| email              | string | null: false |
| encrypted_password | string | null :false |

### Association

- has_many :incomes

- has_many :spendings

## incomeテーブル

| Column     | Type       | Options                        |
|------------| ---------- | ------------------------------ |
| category   | string     | null :false                    |
| year_month | date       | null: false                    |
| value      | integer    | null :false                    |
| user       | references | null: false, foreign_key: true |

### Association

- belongs_to :user

## spendingテーブル

| Column     | Type       | Options                        |
|------------| ---------- | ------------------------------ |
| category   | string     | null :false                    |
| year_month | date       | null: false                    |
| value      | integer    | null :false                    |
| user       | references | null: false, foreign_key: true |

### Association

- belongs_to :user

## ローカルでの動作方法

# 開発環境

# ruby-version 2.6.5
# rails-version 6.0.0
# mysql2-version 0.4.4

```
git clone URL
```

```
bundle install
```

```
rails db:migrate
```
