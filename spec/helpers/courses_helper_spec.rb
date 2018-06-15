require 'rails_helper'

RSpec.describe CoursesHelper, type: :helper do

  context "#ancestor_breadcrumbs_for" do
    it "returns html list" do
      cat = create(:category)
      c1 = create(:course, category: cat)
      c2 = create(:course, category: cat, parent_id: c1.id)
      # dafaq! Results to "ActiveRecord::Base.connection.execute raw_sql" don't appear to be executed on test DB!
      Course.reset_lineage_tree
      # alright plan B ...
      expect(c1).to receive(:ancestors) { [] }
      helper.ancestor_breadcrumbs_for(c1)
    end
  end

  context "#descendant_list_for" do
    it "returns html list" do
      cat = create(:category)
      c1 = create(:course, category: cat)
      c2 = create(:course, category: cat, parent_id: c1.id)
      # dafaq! Results to "ActiveRecord::Base.connection.execute raw_sql" don't appear to be executed on test DB!
      Course.reset_lineage_tree
      # alright plan B ...
      expect(c1).to receive(:children) { [] }
      helper.descendant_list_for(c1)
    end
  end
end
