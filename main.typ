#import "template.typ": template, course

#show: template.with(
  university: "Nanjing University",
  major: "Your Major",
  school: "Your School / Department",
  name: "Your Name",
  id: "Your Student ID",
  duration: "Your standard programme duration",
  total_credits: "Your required local credits",
  // The cover image settings
  cover: (
    logo_path: "logo_nju.jpg",
    logo_width: 55mm,
    logo_with_university_name: false,
  ),
  watermark: (
    img_path: "logo_nju_watermark.svg",
    img_width: 145mm,
  ),
)

= Category 1

#course(
  name: [Course Name 1],
  id: [Course ID 1],
  semester: [Semester 1],
  credit: [Credit 1],
  hours: [Hours 1],
  grade: [Grade 1],
  preparatory: [Preparatory Course(s) 1],
  prerequisite: [Prerequisite(s) 1],
  content: [
    - Chapter 1
    - Chapter 2
    - Chapter 3
  ],
  description: [
    The main body of Course Description 1 \
    #lorem(100)
  ],
  assessment: [
    - Assignment 1
    - Assignment 2
    - Assignment 3
    - Exam 1
    - Exam 2
  ],
)

#pagebreak()

= Category 2

#course(
  name: [Course Name 2],
  id: [Course ID 2],
  semester: [Semester 2],
  credit: [Credit 2],
  hours: [Hours 2],
  grade: [Grade 2],
  preparatory: [Preparatory Course(s) 2],
  prerequisite: [Prerequisite(s) 2],
  content: [
    - Chapter 1
    - Chapter 2
    - Chapter 3
  ],
  description: [
    The main body of Course Description 2 \
    #lorem(100)
  ],
  assessment: [
    - Assignment 1
    - Assignment 2
    - Assignment 3
    - Exam 1
    - Exam 2
  ],
)
