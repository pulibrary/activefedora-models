require File.expand_path('../../lib/rdf/work_properties', __FILE__)

class WorkRdfMetadata < ActiveFedora::NtriplesRDFDatastream

  map_predicates do |map|
    map.identifier({in: RDF::DC})
    map.part_of(:to => "isPartOf", :in => RDF::DC) # index, eg. if is part of a Collection
    map.resource_type(:to => "type", :in => RDF::DC) do |index|
      index.as :stored_searchable, :facetable
    end
    
    map.title(in: RDF::DC) do |index|
      index.as :stored_searchable
    end

    map.sort_title(to: "sortTitle", in: RDF::PULStoreWorks) do |index|
      index.as :sortable
      index.type :string
    end

    map.contributor(in: RDF::DC) do |index|
      index.as :stored_searchable, :facetable
    end

    map.type(in: RDF::DC) do |index|
      index.as :stored_searchable, :facetable
    end

    map.creator(in: RDF::DC) do |index|
      index.as :stored_searchable, :facetable
    end

    map.description(in: RDF::DC) do |index|
      index.type :text
      index.as :stored_searchable
    end

    map.subject(in: RDF::DC) do |index|
      index.type :text
      index.as :stored_searchable
    end

    map.date_uploaded(to: "dateSubmitted", in: RDF::DC) do |index|
      index.type :date
      index.as :stored_searchable, :sortable
    end

    map.date_modified(to: "modified", in: RDF::DC) do |index|
      index.type :date
      index.as :stored_searchable, :sortable
    end


  end
end
