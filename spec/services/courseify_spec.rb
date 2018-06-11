
require 'rails_helper'

COURSE_DATA = <<~JSON_DATA
---
:course:
  :category:
    :grouping: GROUPING
  :name: COURSE
  :description: DESCRIPTION
  :sections:
  - :name: LEVEL1 ITEM1
    :audio_visuals:
    - :purpose: instructional
      :source_url: VIDEOURL
      :transcripts:
      - :language: en
        :body: BODY
    :definitions:
    - :word: WORD
      :audio_visuals:
      - :purpose: mass
        :source_url: PHOTOURL
    :qualifications:
    - :question: QUESTION
    :prerequisites:
    - :description: DESCRIPTION
  - :name: LEVEL1 ITEM2
    :sections:
    - :name: LEVEL2 ITEM1
      :sections:
      - :name: LEVEL3 ITEM1
        :sections:
        - :name: LEVEL4 ITEM1
        - :name: LEVEL4 ITEM2
JSON_DATA


RSpec.describe Courseify do
  context "with course data file import" do
    before {
      yml = YAML.load(COURSE_DATA)
      cat = create(:category, grouping: yml[:course].delete(:category))
      cse = Courseify.new(yml[:course], cat)
      cse.create
    }

    it "has added 7 records" do
      expect(Course.count).to eq(7)
    end
    it "has added 2 audio visual" do
      expect(AudioVisual.count).to eq(2)
    end
    it "has added 1 definition" do
      expect(Definition.count).to eq(1)
    end
    it "has added 1 qualification" do
      expect(Qualification.count).to eq(1)
    end
    it "has added 1 prerequisite" do
      expect(Prerequisite.count).to eq(1)
    end
    it "has added 1 transcript" do
      expect(Transcript.count).to eq(1)
    end
  end

  context "self#load_yaml" do
    let(:user) { create(:supervisor) }
    let(:yml) { YAML.load(COURSE_DATA) }
    before { Courseify.load_yaml(yml, user) }
    it "loads course from yaml" do
      expect(Course.count).to eq 7
    end
    it "creates a course_header" do
      expect(CourseHeader.count).to eq 1
    end
  end

  context "self#titleize" do
    it "at root returns 'Course'" do
      expect(Courseify.titleize(0, 1)).to match "Course"
    end
    it "1 deep returns 'Lesson'" do
      expect(Courseify.titleize(1, 1)).to match "Lesson"
    end
    it "1 deep and 2nd Lesson returns 'Lesson 2'" do
      expect(Courseify.titleize(1, 2)).to match "Lesson 2"
    end
    it "2 deep returns 'Section'" do
      expect(Courseify.titleize(2, 1)).to match "Section"
    end
    it "3 deep returns 'Part'" do
      expect(Courseify.titleize(3, 1)).to match "Part"
    end
    it "4 deep returns 'Paragraph'" do
      expect(Courseify.titleize(4, 1)).to match "Paragraph"
    end
    it "5 deep returns an error" do
      expect{Courseify.titleize(5, 1)}.to raise_error(NoMethodError)
    end
  end
end
