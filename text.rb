class Text < Work
  has_metadata 'text_rdf_metadata', type: TextRdfMetadata

  has_many :pages, property: :is_part_of

  validates :type, inclusion: { 
    in: ['Text'],
    message: "%{value} is not a valid value for type"
  }

  delegate :description, to: 'text_rdf_metadata', multiple: true
  delegate :subject, to: 'text_rdf_metadata', multiple: true
  delegate :language, to: 'text_rdf_metadata', multiple: true

end
