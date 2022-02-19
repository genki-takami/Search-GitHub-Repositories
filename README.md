# GitHubリポジトリを検索できるアプリ「ケンサク」

## 課題：バグ修正・リファクタリング・機能追加・テスト追加

### 免責：PodsフォルダはPushしていないので pod install をお忘れなく

### 環境
```
Mac mini 2020 M1
Xcode 13.2.1
Swift 5.5
テスト Simulator & 実機(iPhone X)
```

### 利用ライブラリ
```
CocoaPods
・SVProgressHUD 2.2.5
・Alamofire 5.4.4
・AlamofireImage 4.2.0
```

### ブランチとタグ
```
main：本番ブランチ、、？
develop：主にこちらで開発
```

### テスト
```
Tests：API周りのデータ取得をテスト
UITests：検索した後のView挙動や新UI機能のテスト
```

### 画面構成
```
１.検索バーと取得したリポジトリデータのリストテーブルがある画面
２.テーブルからタップしたリポジトリの詳細画面
３.詳細画面では表示されていない追加のリポジトリに関するデータを表示する画面
```

### 設計
```
・storyboardを軸にしたMVCアーキテクチャを採用
・検索した後のデータ取得と表示ラグをユーザーに視覚的に認知させるためにモーダルを表示
・ダークモードに対応して、テキストの文字が白と黒で反転するように努力
・GitHubリポジトリのWebサイトも確認できるように３つ目の画面でWebViewを設置
・質素なデザインにアイコンを設置したり丸みを持たせたりして"kawaii"設計
・検索の際に出現するキーボードの右上に、それを閉じてリストを再度眺めるためのボタンを設置
```

### 参考サイト
```
Alamofireについて
[【Swift】AlamofireでAPI通信をする](https://qiita.com/REON/items/094d1b8bc7e59ea44a34)
[【Swift】「Alamofire」ライブラリを使ってみる](https://yamamtoblog.com/alamofire/)
[【Swift】Alamofireを使ってHTTP通信を実装してみた](https://dasuko.hatenadiary.jp/entry/2021/07/16/220812)
[Problems with Alamofire response handler](https://stackoverflow.com/questions/68503188/problems-with-alamofire-response-handler)
GitHub API について
[[Swift]async/awaitを使ってGitHubAPIを叩く（UIKit版）](https://qiita.com/nkekisasa222/items/bdc9947a3a7b1fb126ac)
[GithubAPIでリポジトリをカスタムセルで、一覧表示させてみた](https://qiita.com/SHOBLOG/items/5083e43558581cbf0dee)
ルール・原則について
[Swiftのメモリリークについてまとめてみた](https://qiita.com/ryu1sazae/items/201275f9ac3af1ec9e64)
[Swiftコーディング規約](https://github.com/cookpad/styleguide/blob/master/swift.ja.md)
[クロージャとは](https://swift.codelly.dev/guide/クロージャ/#クロージャ式の定義)
[あなたはDRY原則を誤認している？](https://qiita.com/yatmsu/items/b4a84c4ae78fd67a364c)
[コマンド・クエリ分離の原則（CQS）とは](https://www.youtube.com/watch?v=LsFWDrvS5Ms)
アイデアについて
[すぐに使える！Swiftリファクタリングアイディア集](https://qiita.com/takehilo/items/89e72192b758942af93e#how-to-move-data-sources-and-delegates-out-of-your-view-controllers)
XCTestについて
[XCTest入門 (Swift) ~UITest編~ Part2](https://qiita.com/y-okudera/items/8875177460713bc0ecf3)
[iOS XCTestで非同期処理の完了を待つ](https://hopita.hatenablog.com/entry/2018/08/30/233409)
ダークモードについて
[iOS 13からのダークモード対応のコツ](https://qiita.com/gonsee/items/c04b73787730c0e831df)
```

### 復習コンテンツ
```
Udemy
・必要性から学ぶ、Git・GitHub入門講座
・【iOS13対応】未経験者がiPhoneアプリ開発者になるための全て iOS Boot Camp
```

### スペシャルサンクス
```
MENTAのメンターすばるさん
＞JSONのデコードに躓いたときに気軽にアドバイスをくれました
大学の友人S
＞アプリUIのレビューで日本語にしてくれと指摘してくれた！
```