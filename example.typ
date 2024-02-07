#import "template.typ": *

#let writeDate = datetime(
  year: 2024,
  month: 2,
  day: 6
)

#show: report.with(
  title: "Typst 入門",
  //class: "計数工学実験第二",
  date: writeDate,
  author: "Manato1fg",
  affiliation: "東京大学工学部計数工学科システム情報コース 3年"
)

= はじめに <chap>
素敵な文章．これはとても素敵な文章ですよね．

== 節
節もこのように作成できます．

== フォントの切り替え
`
  set text(
    font: (
      "Times New Roman",
      "Yonaga Old Mincho"
    ),
    size: 12pt
  )
`
`template.typ`で上記のように設定しておくと英語の場合はTimes New Roman，日本語の場合は夜永オールド明朝で表示されます．

== 数式
数式は次のようになります．
$ integral_(-oo)^(oo) exp(-a x^2) = sqrt(pi/a) $

あるいは$display(lim_(x -> 0) sin(x) / x = 1)$のようにインラインで記述することもできます．

インラインで記述する場合は`$...$`で囲み，ブロックレベルにする場合は`$ ... $`で囲みます．

== 脚注
脚注は`#footnote("")`と設定します#footnote("例えばこのようにね")<fn1>．名前を付けられるので@fn1 と参照することもできます．

= 章
章は参照することもできます．`@chap`$->$@chap

== 定義・定理・系
定義や定理は#link("https://github.com/sahasatvik/typst-theorems")[こちら]をコピペしました．

#definition[円周率とは，円の直径に対する円周の長さの比率のことである．これを特別な数字として$pi$と表す．]
#theorem("Euler")[
  平方数の逆数の和について以下が成り立つ．
  $ sum_(n=1)^(oo) 1/n^2 = pi^2/6 $ <eq:Euler>
]
@eq:Euler はオイラーの公式として知られている．定義と定理のカウンターは別々にしています．

#definition[Maxwell方程式とは以下の四式のことを指す．
$ div vb(E) = rho/epsilon_0 $
$ curl vb(E) = -pdv(vb(B), t) $ <eq:E>
$ curl vb(B) = mu_0 (vb(j) + epsilon_0 pdv(vb(E), t)) $ <eq:B>
$ div vb(B) = 0 $
]<def:Maxwell>

#theorem[
  真空中では電磁波は波として振る舞う．
]<thm:EMWave>
証明の前に以下のベクトル解析の公式を証明しておこう．
#lemma[
  なめらかなベクトル場$vb(A) in bb(R^3)$について以下が成り立つ．
  $ curl curl A = grad(div A) - nabla^2 A $
]<lem:vec>

#proof[
  \
  $vb(A) = (A_x, A_y, A_z)$ について左辺の第一成分だけ計算してみよう．
  #notag[$ curl A := vec(pdv(A_z, y) - pdv(A_y, z), pdv(A_x, z) - pdv(A_z, x), pdv(A_y, x) - pdv(A_x, y) ) $]
  であるから，

  #notag[
    $ curl curl A|_x &= pdv(, y)(pdv(A_y, x) - pdv(A_x, y)) - pdv(, z)(pdv(A_x, z) - pdv(A_z, x)) \ 
    &= pdv(, x)(pdv(A_x, x) + pdv(A_y, y) + pdv(A_z, z)) - (pdv(, x, 2) + pdv(, y, 2) + pdv(, z, 2))A_x $ 
  ]
  を得る．\
  よって他の各成分についても同様に計算することで証明することができる．
]
では@thm:EMWave を示してみよう．
#proof[
  \
  真空中では@def:Maxwell において$rho = 0, vb(j) = vb(0)$としてよい．@eq:E で両辺のrotを計算する．\
  左辺は@lem:vec より，
  $ 
  curl curl vb(E) &= grad(div vb(E)) - nabla^2 vb(E) \ 
  &= -nabla^2 vb(E)
  $<eq:7>
  右辺は
  $
  -curl pdv(vb(B), t) &= pdv(, t)(curl vb(B)) \
  &= -mu_0 epsilon_0 pdv(vb(E), t, 2)
  $<eq:8>
  である．

  よって，@eq:7, @eq:8 より，
  $ nabla^2 vb(E) = mu_0 epsilon_0 pdv(vb(E), t, 2) $
  を得る．これは波動方程式であり，その速さは$display(c = 1 / sqrt(mu_0 epsilon_0))$である．$vb(B)$についても同様の計算で速さ$c$で進む波であると分かる．
]

#definition[
  $display(c = 1 / sqrt(mu_0 epsilon_0))$ を光速と呼ぶ．
]

#remark[
  光速は現在では$299,792,458$ m/sと定義される物理定数である．
]