# JSON-LD renderer
ActionController.add_renderer :jsonld do |obj, options|
  self.content_type ||= Mime::JSONLD
  obj.respond_to?(:to_json) ? obj.to_json(options) : obj
end
