class ConceptObserver < ActiveRecord::Observer
  def after_save(concept)
    concept.update_attribute( :slug, concept.title.gsub(/[^a-zA-Z0-9]+/i, '-').downcase ) unless concept.slug == concept.title.gsub(/[^a-zA-Z0-9]+/i, '-').downcase
  end
end