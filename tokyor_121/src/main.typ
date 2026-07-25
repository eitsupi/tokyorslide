#set text(lang: "ja")

#import "@preview/touying:0.7.4": *
#import themes.stargazer: *

#import "@preview/numbly:0.1.0": numbly

#show: stargazer-theme.with(
  aspect-ratio: "16-9",
  config-info(
    title: [ここ半年くらいでAIに作らせたR用ツール],
    subtitle: [arf console, rd2qmd, jgd, ...],
    author: [\@eitsupi],
    date: datetime.today(),
  ),
)

#set heading(numbering: numbly("{1}.", default: "1.1"))

#title-slide()

#outline-slide()
