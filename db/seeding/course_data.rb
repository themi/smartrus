require "yaml"

def lesson_name(number)
  "Lesson #{number}"
end

def section_name(number)
  "Section #{index.romanize}"
end

def part_name(number)
  "Part #{(65 + number).chr}"
end

def add_data(parent, cse_hash)
  avs = cse_hash.delete[:audio_visuals]
  avs.each do |av|
    AudioVisual.create(av.merge({course: parent}))
  end

  defs = cse_hash.delete[:definitons]
  defs.each do |defn|
    Definition.create(defn.merge({course: parent}))
  end

  quals = cse_hash.delete[:qualifications]
  quals.each do |qual|
    Qualification.create(qual.merge({course: parent}))
  end
end

def create_course(cse_hash, cat)
  parent = Course.create(cse_hash[:sections].merge(category: cat))
  add_data(parent, cse_hash)
  sections = cse_hash[:sections].delete[:sections]

  sections.each do |sect_hash|
    create_course(sect_hash, cat)
  end
end

filename = Rails.root.join("db/seeding/ironing_trousers.yml")
data = YAML.load(File.read(filename))

cat = data[:course].delete[:catgeory]
cat = Catgeory.find_or_create_by(cat)

parent = Course.create(cse_hash[:course].merge(category: cat))
add_data(parent, cse_hash)
sect_hash = cse_hash[:course].delete[:sections]

create_course(sect_hash, cat)

