#let report(title: "", class: "", date: "", author: "", affiliation: "", body) = {
  set text(
    font: (
      "Times New Roman",
      "Source Han Serif VF"
    ),
    size: 12pt
  )

  let textMargin(text, above: 8pt, below: 8pt) = {
    block(above: above, below: below, text)
  }

  set page(
    paper: "a4",
    margin: (
      bottom: 1.75cm, top: 2.5cm,
      left: 2cm, right: 2cm
    ),
  )

  set par(leading: 0.8em, first-line-indent: 20pt, justify: true)
  show par: set block(spacing: 1.4em)

  show link: underline
  show link: set text(fill: rgb("#125ee0"))

  set heading(numbering: "1.1.")

  set page(numbering: "1 / 1")

  // date
  align(right, text(12pt)[
    #date.display("[year]年[month]月[day]日")
  ])

  if class != "" {
      align(center, textMargin(
        text(14pt)[#class],
        below: 8pt
      ))
  }

  align(center, text(24pt)[
    *#title*
  ])

  align(center, text(16pt)[
    #author
  ])
  align(center, textMargin(
    text(12pt)[
      #affiliation
    ],
    above: 8pt
  ))

  body
}