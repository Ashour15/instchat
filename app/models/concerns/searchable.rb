module Searchable
 extend ActiveSupport::Concern

 included do
   include Elasticsearch::Model
   include Elasticsearch::Model::Callbacks

   def as_indexed_json(_options = {})
     as_json(only: %i[body])
   end
   
   settings settings_attributes do
     mappings dynamic: false do
       indexes :body, type: :text, analyzer: :autocomplete
     end
   end

   def self.search(query)
    __elasticsearch__.search({
      query: {
        bool: {
          should: [
            {
              multi_match: {
                query: query,
                fields: :body }
            }, {
              match_phrase_prefix: {
                body: query
              }
            }
          ]
        }
      }
      }).records
   end
 end

  class_methods do
   def settings_attributes
     {
       index: {
         analysis: {
           analyzer: {
             autocomplete: {
               type: :custom,
               tokenizer: :standard,
               filter: %i[lowercase autocomplete]
             }
           },
           filter: {
             autocomplete: {
               type: :edge_ngram,
               min_gram: 2,
               max_gram: 10
             }
           }
         }
       }
     }
    end
  end
end