class SearchEngine
  def initialize(search_term)
    @search_term = '%' + search_term.to_s + '%'
  end

  # returns an array of hashes for each model.  Each hash looks like this:
  # { label: 'John Smith', record: <User id: 1, first_name: 'John', ...> }
  def search_now
    results = {}
    searchable_models.each do |this_model|
      results[this_model.name.to_sym] = this_model.search_for(@search_term)
    end
    results
  end

  private

  def searchable_models
    [Opportunity, Organisation, Person, CurriculumVitae]
    # [Opportunity]#, Organisation, Person, CurriculumVitae]
  end
end
