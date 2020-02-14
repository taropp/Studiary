### 1/29 start!!

# 1.トライしたこと  

## gemの複数導入  
・gemに関しては色々試すことができた。  
・あやふやなまま使ったものもあったので、要復習。  

## rspecの導入  
・everydayrailsで学んだことをアウトプットするために書いた。  
・しかし、自分の中のテスト項目の少なさを痛感した。  
・結局ほぼまる写しになったが、多少のアレンジを加えることはできた。  
・次回アプリを作るときは、色々な機能の導入と同時にテストを書いていきたい。  

## slimの導入  
・erbが煩雑に見えてしまい、解消するためにslimを導入した。  
・今回は自動生成も頼った箇所はあったが、次回は自分でかける程度までは習得できた。  

## こまめなcommit  
・初めのうちからなるべく細かいcommitを意識した。  
・その結果色々なチャレンジができ、失敗してもすぐ戻ることができた。  
・初めのうちはメッセージは適当だったが、中盤あたりからはなるべくwhyを意識して書いてみた。  


# 2.トライしたが、実現できなかったこと  

## 投稿フォームのmodal表示導入ができなかった  
・何度もトライはしたが、参考にしたサイトが混ざりすぎ、収拾がつかなくなった。  
・そのためキチンと仕組みを理解してから取り組むことに決めた。  
・これからも少しずつ修正を加えていきたい。  


# 3.トライせず、実現できなかったこと  
・編集ページの項目に関しては、userモデルとdeviseとの関わり方を深く理解できていなかった。  
・開発初期の頃痛い目をみたので触らなかった。LGTMをもらい次第、再チャレンジする。  
・3列表示に関しては、デザインを整え直したあとトライする。  


# 4.作成にあたり学んだこと  

### 自分の理解度に数字をつける  
・導入した技術に対しての理解度を数値化するのは必須。  
・最低限人に説明できる程度(コードを0から書ける必要はない、はず)は理解する。  
・人に説明できるレベルを理解度5とする。  
・最終的に自分のアプリについては全ての仕組みを答えられるようにする。  
・ここで10を目指すと先に進めなくなるので注意。  

### 勉強の方法を確立する  
例.Rails  
    1.書籍(Railsチュートリアル、現場で~実践ガイド)で勉強する。  
    2.その中身でわからないこと(問題の根本)をググる。  
    3.そのための解決策にアテをつける。  
    4.公式読む。  
    5.実際に動くか導入して確かめる。  
  
### 読みやすいコードを意識する  
・リーダブルコードで学習。  
・rubocop導入である程度は矯正される。  
・ただし、あまり意識しすぎない。まだその実力はない。  

### デザインの細かな修正は一番最後に一気にする  
・都度都度作成していったため、間延びした。  
・どこにどの設定が書いてあるかわからなくなった。  
・Bootstrapの理解度が低く、うまくいじることができなかった。  

### 闇雲に試した結果、わからないことが膨れ上がり、収集つかなくなることを避ける  
・情報を選定し、まずはその情報のみで進める。  
・信頼できる情報かを確かめる。  
    1.導入する技術に関しては、Qiita(例.100いいね以上)など。  
    2.gemに関してはgithubが一番。  
    3.実際に導入してみた人に所感を聞く。  
    4.実際に使われているアプリを覗きにいく。  

### わかったふりをせず、わからないことを出していく  
・これが一番今回を通して痛感した。  
・先に進まなければという圧に負け、導入さえできれば次へを繰り返した。  
・その結果、形にはなったが自分が説明できないものが出来上がった。  
・先に進むことも大事だが、新しい技術を自分の血肉にすることが一番大事だということを身を以て体験できた。  
・まぁいいかで結局苦労するのは自分であることを忘れてはいけない。  
・PRを出している間に総復習し、本課題につなげていきたい。  

### エラーの自己解決能力  
・一番身についたものはこれだと思う。  
・今ではエラーが出ると解決できた時のことを想像し、興奮するようになってしまった。  

### 質問することの大切さ  
・書くことでエラーに至った経緯、自分が試したこと、起こった現象を洗い出すことになる。  
・そうすることで頭の中で考えていたことが整理され、本当に必要なことが浮き彫りになってくる。  
・実際質問してみてそのあと自分で解決したものがある。  
・あれは質問をする前に何時間も一人で悩み、ギブアップして投稿したものである。  
・視点を変える、いったん考えを整理することはとても重要だと感じた。  


書き漏らした箇所もあるかもしれませんが、以上がcloneapp作成の過程で学んだことです。  
レビューのほどよろしくお願いします。

※最後に改行が入っているファイルが多いですが、  
rubocopの自動修正を使用すると入るため、あえて放置してあります。