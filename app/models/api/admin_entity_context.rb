require 'rdf/vocab'

module Api
  class AdminEntityContext < Context

    contextualize_as_type RDF::FOAF.Agent
    contextualize :slug, as: RDF::Vocab::Identifiers.local
    contextualize :name, as: RDF::FOAF.name
    contextualize :short_name, as: RDF::DC.alternative
    contextualize :email, as: RDF::FOAF.mbox
    contextualize :phone, as: RDF::FOAF.phone
    contextualize :url, as: RDF::FOAF.page
    contextualize :created_at, as: RDF::DC.created, type: RDF::XSD.dateTime
    contextualize :updated_at, as: RDF::DC.modified, type: RDF::XSD.dateTime

  end
end
