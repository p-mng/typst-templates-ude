#import "softec-template/softec-template.typ": chapter, hanging, quotation, softec_template

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
  cite(<ralph2009>, supplement: [P.~108]),
)

Die einzelnen Elemente der Definition können nun genauer geprüft werden, um zu verstehen was die Intention hinter der Wahl dieser Begriffe war #cite(<ralph2009>, supplement: [S.~105--108]):

#hanging[*Specification*: Als Spezifikation wird hier die detaillierte Beschreibung eines Objektes, bezogen auf seine Struktur und die in ihm genutzten Komponenten, angeführt. Folglich besteht ein Design immer aus bereits bestehenden Komponenten.]

#hanging[*Design Object*: Die Entität, die entworfen wird, muss -- wie im Software Engineering üblich -- kein physischen Objekt sein muss. Im Kontext des Software- und Web-Engineering ist dies das erzeugte Artefakt.]

#hanging[*Design Agent*: Ein Subjekt oder eine Gruppe von Subjekten erzeugt das Design. Dabei wird üblicherweise von Menschen ausgegangen, allerdings kann auch eine Software diese Aufgabe übernehmen.]

#pagebreak()
#bibliography("softec-refs.bib", style: "springer-basic-author-date")
