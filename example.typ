#import "template.typ": *

#let writeDate = datetime(
  year: 2024,
  month: 2,
  day: 4
)

#show: report.with(
  title: "Typst 入門",
  //class: "計数工学実験第二",
  date: writeDate,
  author: "Manato1fg",
  affiliation: "東京大学工学部計数工学科 3年"
)

= はじめに
素敵な文章．これはとても素敵な文章ですよね．Typstを使うとこんなに簡単にテンプレートの作成などができるのですね．

