#import "softec-template/softec-template.typ": *

#show: softec_template.with()

#chapter("Motivation")

#quotation(
  ["There are essentially two basic approaches to design: the artistic ideal of expressing yourself and the engineering ideal of solving a problem for a customer."],
  cite(<nielsen1999>, supplement: [S.~11]),
)

Die Definition nach #cite(<nielsen1999>, form: "author") deckt bereits mehrere für das Web relevante Aspekte des Design-Begriffes ab:

- Zum Einen den künstlerischen Aspekt, der unter anderem der Aussage Rechnung trägt, dass Software- bzw. Web-Entwicklung immer ein kreativer Prozess ist.
- Zum Anderen aber auch den ingenieurmäßigen Aspekt, bei dem es um strukturierte Vorgehensweisen geht.

Gleichzeitig zeigt es aber auch daran angelehnt zwei Ausgangspunkte für Design: Das eigene Selbst, sowie die Anforderungen des Kunden. Auch wenn im Rahmen der Wirtschaftsinformatik sicherlich das ingenieurmäßige Vorgehen und der Kunde die Aspekte der Wahl sind, so zeigt diese einfache Definition doch schon zwei Dinge auf: Es gibt unterschiedliche Auffassungen des Begriffs und unterschiedliche Einflussfaktoren auf das Design, die beachtet werden müssen. \
Denn das Design der Web-Applikationen (und damit sei an dieser Stelle sowohl die Dar- stellungsform, als auch der technische Entwurf gemeint) hat eindeutig Einfluss darauf, ob potenzielle Kunden die Anwendung benutzen. Damit wird der eigentliche Kern der Betrachtung offensichtlich: Die Usability von Web-Anwendungen. \
Um dieses Thema zu betrachten sind zunächst einige Grundlagen im Bereich des Designs notwendig. Neben einer Begriffsdefinition und den beiden grundsätzlichen Ansätzen Product Design und Interaction Design wird dann auf die im Web in diesem Rahmen wichtigen Bereiche Accessibility und Usability eingegangen. Dabei wird darauf aufbauend nicht nur ein Überblick über Methoden gegeben, die das Produkt selbst verbessern, sondern auch darauf eingegangen, wie solche Methoden als Prozess implementiert werden können.

#chapter("Grundlagen des Design")

In diesem Kapitel wird zunächst in die Begriffswelt des Design eingeführt. Neben der Betrach- tung des Begriffes selber werden Stakeholder identifiziert und unterschiedliche Designansätze aus unterschiedlichen Bereichen angeführt.

== Definition des Begriffes Design

Für den Begriff Design ist eine Definition notwendig, da es bspw. ein übliches Missverständnis ist, das _Design_ pauschal mit _gutem Design_ gleichgesetzt wird -- auch wenn dies sicherlich ein erstrebenswerter Zustand ist, so schließt Design natürlich auch sub-optimale Zustände ein, bspw. während einer Ist-Analyse und vor einer Verbesserung (Ralph und Wand 2009, S. 104-105). Ralph und Wand haben eine formale Definition für Design entwickelt und ermöglichen so, diesen Begriff möglichst vollständig zu erfassen:

#quotation(
  [
    "*Design* \
    (_noun_) a _specification of an object, manifested by some agent, intended to accomplish goals, in a particular environment, using a set of primitive components satisfying a set of requirements, subject to some contraints_; \
    (_verb_, _transitive_) to create a design, in an environment (where the designer operates)."
  ],
  cite(<ralph2009>, supplement: [S.~108]),
)

Die einzelnen Elemente der Definition können nun genauer geprüft werden, um zu verstehen was die Intention hinter der Wahl dieser Begriffe war #cite(<ralph2009>, supplement: [S.~105--108]):

#hanging[*Specification*: Als Spezifikation wird hier die detaillierte Beschreibung eines Objektes, bezogen auf seine Struktur und die in ihm genutzten Komponenten, angeführt. Folglich besteht ein Design immer aus bereits bestehenden Komponenten.]

#hanging[*Design Object*: Die Entität, die entworfen wird, muss -- wie im Software Engineering üblich -- kein physischen Objekt sein muss. Im Kontext des Software- und Web-Engineering ist dies das erzeugte Artefakt.]

#hanging[*Design Agent*: Ein Subjekt oder eine Gruppe von Subjekten erzeugt das Design. Dabei wird üblicherweise von Menschen ausgegangen, allerdings kann auch eine Software diese Aufgabe übernehmen.]

#figure(
  caption: [Definition für Design als Substantiv #cite(<ralph2009>, supplement: [S.~109])],
  image("softec-template/figures/figure-2.1.drawio.pdf"),
)

#hanging[*Environment:* Beim Kontext des Designs, lassen sich zwei Bereiche unterscheiden: Zunächst der Kontext, in dem das Artfefakt angewendet werden oder existieren soll und darüber hinaus auch der Kontext, in dem der Agent agiert um das Design zu erzeugen. #footnote["For instance, the software created by a developer is intended to operate in a different environment than the developer" #cite(<ralph2009>, supplement: [S.~107])]]

#hanging[*Goals:* Die Ziele eines Designs stellen erwünschte Aussagen über das Objekt dar, die auf unterschiedliche Abstraktionsgraden vorliegen können. Damit haben Sie natürlich einen Bezug zum Einfluss des Objektes in seinem Kontext. #footnote[Ziele sind dabei keine notwendige Voraussetzung für ein Design und daher optional. Allerdings bleibt anzumerken, dass ein Design, selbst wenn es kein artikuliertes Ziel verfolgt, immer noch eine Intention haben muss – sonst wäre es kein Design #cite(<ralph2009>, supplement: [S.~106--107).])]]

#hanging[*Primitives:* Die zur Verfügung stehenden Komponenten (bzw. Typen von Komponenten), aus denen das Design entwickelt wird.]

#hanging[*Requirements:* Strukturelle oder verhaltensorientierte Anforderungen an das Objekt. Struk- turelle Eigenschaften sind dabei unabhängig von einem bestimmten Kontext oder von Stimuli. Verhaltensorientierte Eigenschaften dagegen definieren das Verhalten auf ein vorgegebenes Set an Kontextzuständen und Stimuli. #footnote[Folglich sind strukturelle Eigenschaften solche, die nicht von einem vorher definierten Kontext oder Stimuli abhängen]]

#hanging[*Constraints:* Strukturelle oder verhaltensorientierte Einschränkungen für das Objekt. Also diejenigen Randbedingungen, die nicht vom Agenten, durch die Aufgabe oder durch die Komponenten vorgegeben sind. #footnote["[...] physical design is still constrained by the laws of physics, virtual design by the speed and memory of the computational environment, and conceptual design by the mental faculties of the design agent." #cite(<ralph2009>, supplement: [S.~107])]]

#sidenote("Design muss nicht in einem Produkt resultieren.")
Interessant an dieser Unterscheidung ist vor allem das, was in der Disziplin des Software Engineering ebenso vorgefunden werden kann: Das Ergebnis eines Designs kann auch nur eine Spezifikation sein, die das Objekt beschreibt und muss nicht zwingend das fertig umgesetzte Objekt sein.

#pagebreak()
#bibliography("softec-refs.bib", style: "springer-basic-author-date")
