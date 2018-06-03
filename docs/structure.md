
course
  name
  description
  objective
  category
  reason_why
  lessons>

be rails g scaffold course name description category objective reason_why

lesson/section/part
  position
  name
  description
  objective
  reason_why
  audio_visuals>
  definitions>
  transcripts>
  qualifications>
  sections/parts>

be rails g model study course:references position:integer name description objective reason_why

definition
  word
  description
  mass_link
  positive_examples
  negative_examples
  origin
  reference

be rails g scaffold definition word description audio_visual_link positive_examples:text negative_examples:text origin reference

qualification
  question_or_task
  answer_reference

be rails g model qualification question_or_task:text answer_reference:text

audio_visual
  source

be rails g model audio_visual position:integer source

transcript
  language
  body

be rails g model transcript language body:text audio_visual:references
