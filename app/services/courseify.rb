class Courseify
  attr_accessor :data_hash, :category
  attr_reader :sections, :avs, :defns, :quals

  def initialize(data_hash, category)
    @data_hash = data_hash
    @category = category
  end

  class << self
    COUSRE_LEVEL_NAME = [:course, :lesson, :section, :part, :paragraph]

    def titleize(depth, number)
      send("#{COUSRE_LEVEL_NAME[depth]}_name", number)
    end

    def course_name(number=nil)
      I18n.t('.course', default: 'Course')
    end

    def lesson_name(number)
      I18n.t('.lesson', default: 'Lesson') + " #{number}"
    end

    def section_name(number)
      I18n.t('.section', default: 'Section') + " #{number.romanize}"
    end

    def part_name(number)
      I18n.t('.part', default: 'Part') + " #{(64 + number).chr}"
    end

    def paragraph_name(number)
      I18n.t('.paragraph', default: 'Paragraph') + " #{number}"
      "Paragraph #{number}"
    end
  end

  def create(parent=nil)
    strip_additionals(data_hash)
    course = Course.create(data_hash.merge({category: category, parent_id: parent.try(:id)}))
    save_additionals(course)
    sections.each do |sect_hash|
      Courseify.new(sect_hash, category).create(course)
    end
    course
  end

  private

    def strip_additionals(data_hash)
      @sections = data_hash.delete(:sections) || []
      @avs = data_hash.delete(:audio_visuals) || []
      @defns = data_hash.delete(:definitons) || []
      @quals = data_hash.delete(:qualifications) || []
    end

    def save_additionals(course)
      create_audio_visuals(avs, course)
      create_qualifications(quals, course)
      defns.each do |defn|
        create_definition(defn, course)
      end
    end

    def create_definition(data_hash, course)
      av_array = data_hash.delete(:audio_visuals) || []
      definition = Definition.create(data_hash.merge({course: course}))
      create_audio_visuals(av_array, definition)
    end

    def create_audio_visuals(av_array, imageable)
      av_array.each do |av|
        AudioVisual.create(av.merge({imageable: imageable}))
      end
    end

    def create_qualifications(qual_array, course)
      qual_array.each do |qual|
        Qualification.create(qual.merge({course: course}))
      end
    end

end
