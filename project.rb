require File.expand_path('../lib/active_fedora/pid', __FILE__)

class PulStore::Project < PulStore::Base

  # Metadata
  has_metadata 'descMetadata', type: PulStore::ProjectRdfMetadata

  # Delegate attributes
  has_attributes :description, :display_label, :project_identifier,
    :datastream => 'descMetadata', multiple: false

  # Associations
  has_many :parts, property: :is_part_of_project, :class_name => 'ActiveFedora::Base'

  # Validations
  validates :description, presence: true
  validates :display_label, presence: true
  validates :project_identifier, presence: true

end
