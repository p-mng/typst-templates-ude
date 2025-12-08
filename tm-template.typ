#import "tm-template/tm-template.typ": subcaption, table_stroke, tm_template
#import "@preview/acrostiche:0.7.0": *

#show: tm_template.with(
  // see `tm-template/tm-template.typ` for possible values
  // ...
)

= Introduction

The suggested structure serves only as an example! Be aware that the structure of your introduction may vary depending on the topic of your thesis.

== Motivation

== Objectives of Thesis and Research Question

== Structure of the Thesis

= \<Background / State-of-the-Art>

Here, you describe the current body of knowledge that is relevant for your thesis. This can also be supported by using tables or figures.

== \<Fundamentals 1: Tables>

Exemplary Table:

#figure(caption: "This is an exemplary table", table(
  columns: (1fr, 1fr, 1fr),
  inset: 0% + 8pt,
  [*COLUMN 1*], table.vline(stroke: table_stroke, start: 1), [*COLUMN 2*], [*COLUMN 3*],
  table.hline(stroke: table_stroke),
  [*LINE 1*], "A", "AA",
  [*LINE 2*], "AB", "...",
  [*LINE 3*], "...", [],
))<example-table>

As you see, Figures are handled according to tables:

#figure(caption: "IS Success Model", image("tm-template/figures/example-figure.drawio.pdf"))

#subcaption[Source: #cite(<delone2003>, form: "prose")]

If you want to avoid that your figures and their legends separate from one another, you should use the function of "Gruppieren"/"Group", namely grouping them into one object.

= \<Research Method>

== \<First sub-chapter>

=== \<First sub-sub-chapter of your sub-chapter>

=== \<Second sub-sub-chapter of your sub-chapter>

== \<Second sub-chapter>

= \<Results>

== \<First sub-chapter>

=== \<First sub-sub-chapter of your sub-chapter>

=== \<Second sub-sub-chapter of your sub-chapter>

== \<Second sub-chapter>

= \<Discussion>

This typically includes answering your research question by shortly reflecting your main findings. Furthermore, the implications of your findings and their contribution to the body of knowledge should be thought of.

== \<First sub-chapter>

=== \<First sub-sub-chapter of your sub-chapter>

=== \<Second sub-sub-chapter of your sub-chapter>

== \<Second sub-chapter>

= Conclusion

== Summary

== Limitations

Here, you mainly address the limitations of your thesis and how they may have influenced your results.

== Future Work

#bibliography("tm-refs.bib", style: "apa")
