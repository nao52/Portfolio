# [【ユーザーチューブ】]

## サービス概要
YouTubeが好きな人たちユーザー登録を行い、登録チャンネルや高評価した動画を他のユーザーと共有することができる。
フォローしたユーザーのおすすめ動画をチェックしたり、ジャンル(ゲーム実況、お金系、美容系など)ごとに、どんな動画が人気なのかチェックすることができる。
友人や年齢の近い人がどんな動画を見ているのかなどを知ることができる。

## 想定されるユーザー層
* YouTubeが好きな人
* 他の人がどんなチャンネルが好きか知りたい人
* 自分の好きなチャンネルを人と共有したい人
* おすすめの動画や他の人が多くみているチャンネルについて知りたい人

## サービスコンセプト
### 1.ユーザーが抱えている課題感と提供するサービスでどのように解決するのか
* YouTubeのおすすめ動画は視聴履歴などに基づくので傾向が視聴の傾向が偏ってしまう。(課題点)
* 同世代に人気の動画やチャンネルがわからないので、話のネタとして言いにくい。(課題点)
* 様々なユーザーが登録チャンネルを共有することで、友人や同世代の人どんなチャンネルを見ているのか知ることができる。
### 2. なぜそのサービスを作ろうと思ったのか
* 友人がどんな動画やチャンネルを見ているのか知り、会話のネタにしたい。
* 好きなチャンネルや動画を見ている人と繋がりたい。
* 自分の好きなチャンネルや動画などを人に共有できるサービスが欲しい。(Twitterは、関連のない投稿も多いため)
### 3. どのようなサービスにしていきたいか
* YouTubeの動画について、ジャンル別に人と共有したい！(料理系ならコレ！美容系ならコレ！のような)
* 好きなチャンネルが一緒の人たちで集まって、チャットなどがしたい！
* 自分が普段あまり見ないジャンルの動画などをみるきっかけにしたい！
### 4. どこが売りになるか、差別化ポイントになるか
* YouTubeを共有することが目的のサービスなので、動画に対するレビューや共有に特化している
* 好きなチャンネルを見ているユーザーを簡単に見つけることができる
* 「登録チャンネル」や「高評価している動画」の共有、動画の感想の投稿、友人知人の好きな動画やチャンネルなど、視聴者向けのサービスを多く提供している点

## 実装を予定している機能
### MVP
* トップページ  
→ サービス名や得られる体験、メリットなどを端的に表示する  
→ ユーザー登録とログインオプション  
→ 機能のハイライト  
* 検索 / 一覧ページ  
→ ユーザー一覧  
 → 「ユーザー名」「登録チャンネル」「年齢」「興味のあるジャンル」などで絞り込み検索が可能  
→ 登録チャンネル一覧(登録者順で並べ替えなど)  
 → 「チャンネル名」「チャンネル概要」などで絞り込み検索が可能  
→ 高評価されている動画一覧  
 → 「動画内容」「ジャンル」などで絞り込み検索が可能   
→ 投稿一覧  
 → 自身の投稿 / フォローしているユーザーの投稿が新着順に表示される  
→ 新着通知一覧  
 → ユーザーがフォローしているユーザーやコメントに関する通知を表示  
* ユーザー詳細  
→ Googleログインによる「登録チャンネル一覧」と「高評価動画一覧」の取得
→ 登録しているチャンネル一覧  
→ 登録チャンネルの公開/非公開の設定  
→ 高評価した動画一覧
→ 高評価した動画の公開/非公開の設定
→ フォロー、フォロワー一覧  
→ 好きなチャンネル登録者ベスト3  
→ 好きな動画ベスト3  
→ 投稿一覧  
* 会員登録 / ログイン  
→ 「名前(必須)」「メールアドレス(必須)」「パスワード(必須)」「年齢」「性別」「興味のあるジャンル」などが登録可能  
→ 「パスワードの再設定」「自動ログイン」などを実装予定  
* コンテンツ投稿  
→ 「視聴した動画、チャンネル名、評価(5段階)、感想など」を自由に投稿できる  
* いいね  
→ 投稿、好きなチャンネルベスト3、好きな動画ベスト3などにいいねができる  
* コメント  
→ 投稿にコメントができる  

### その後の機能
* パンくず機能
* マルチ検索・オートコンプリート  
* キューとバックグラウンド処理
* GitHub Actionsを用いたCI/CD
* フロントのSPA化
* インフラにAWSを使用

## 画面遷移図
https://www.figma.com/file/zRqwhkaC1tWjNZuiPPdbpY/%E7%94%BB%E9%9D%A2%E9%81%B7%E7%A7%BB%E5%9B%B3?type=design&node-id=6%3A159&mode=design&t=LeT9OZ7d3GAXszDL-1

## ER図
[![Image from Gyazo](https://i.gyazo.com/f44bbd257944def7416ef1eb8162d2bb.png)](https://gyazo.com/f44bbd257944def7416ef1eb8162d2bb)
