#let template(
  university: none,
  major: none,
  school: none,
  name: none,
  id: none,
  duration: none,
  total_credits: none,
  cover: none,
  watermark: none,
  doc,
) = {
  set page(paper: "a4", margin: (x: 25mm, y: 25mm))
  set text(font: "Libertinus Serif", size: 11pt, lang: "en")

  // Cover
  page()[
    #align(center)[
      #v(8mm)
      #image(cover.logo_path, width: cover.logo_width)
      #v(8mm)
      #if not cover.logo_with_university_name {
        text(weight: "semibold", size: 24pt)[#university]
        v(10mm)
      }
      #text(weight: "bold", size: 30pt, "Course Description")
      #v(1fr)
      #text(weight: "semibold", size: 16pt)[#major]
      #parbreak()
      #text(size: 14pt)[#school]
    ]
    #v(3fr)
    #set text(weight: "medium", size: 14pt)
    Name: #name #parbreak()
    Student No. #id #parbreak()
  ]

  // Credit System Explanation Page
  page(
    footer: [#h(1fr)#datetime.today().display()],
    background: if watermark != none {
      align(center + horizon, image(watermark.img_path, width: watermark.img_width))
    },
  )[
    #align(center)[
      #text(weight: "bold", size: 18pt)[Credit System Explanation]
    ]
    
    #v(1em)
    
    #set par(justify: true, leading: 0.65em)
    #set text(size: 11pt)
    
    This document describes undergraduate courses studied by #name at #university in the #major programme.

    #v(1em)
    #table(
      columns: (auto, 1fr),
      stroke: 0.5pt,
      inset: 10pt,
      [*Standard programme duration*], [#duration],
      [*Graduation credit requirement*], [#total_credits],
      [*Credits in course entries*], [#university local credits],
    )

    #v(1em)
    Course credits and teaching hours are reported separately, following the academic transcript and course syllabus. Local credits and teaching hours should not be treated as interchangeable measures of total workload.

  ]

  // Page settings
  set page(
    header: [
      Course Description - #name
      #h(1fr)
      #university
    ],
    footer: context [
      #counter(page).display("1 / 1", both: true)
      #h(1fr)
      #datetime.today().display()
    ],
    background: if watermark != none {
      align(center + horizon, image(watermark.img_path, width: watermark.img_width))
    }
  )

  // Table of contents
  page(footer: [#h(1fr)#datetime.today().display()])[
    #outline(
      title: "Table of Contents",
      indent: 2em,
    )
  ]

  // Main body
  counter(page).update(1)
  set par(justify: true)
  set heading(numbering: "1.1.")
  doc
}

#let course(
  name: none,
  id: none,
  semester: none,
  credit: none,
  hours: none,
  grade: none,
  preparatory: none,
  prerequisite: none,
  content: none,
  description: none,
  assessment: none,
) = {
  heading(depth: 2)[#name]
  let cells = (
    ([*Course Title*], name),
    ([*Course No.*], id),
    ([*Semester*], semester),
    ([*Credit*], credit),
    ([*Course Hours*], hours),
    ([*My Grade*], grade),
    ([*Preparatory Course(s)*], preparatory),
    ([*Prerequisite(s)*], prerequisite),
    ([*Content*], content),
    ([*Course Description*], description),
    ([*Assessment*], assessment),
  )
  let table_args = ()
  for row in cells {
    if row.at(1) != none {
      table_args.push(row.at(0))
      table_args.push(row.at(1))
    }
  }
  table(
    columns: (auto, 1fr),
    ..table_args,
  )
}
