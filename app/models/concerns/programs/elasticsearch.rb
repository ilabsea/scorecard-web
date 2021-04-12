# frozen_string_literal: true

module Programs::Elasticsearch
  extend ActiveSupport::Concern

  included do
    after_create { ProgramWorker.perform_async(id) }

    def reindex_documents
      delete_index
      create_index
      index_documents
    end

    def index_name
      @index_name ||= "#{Scorecard.index_name}_#{name.downcase.split(' ').join('_')}"
    end

    def create_index
      return if client.indices.exists(index: index_name)

      client.indices.create \
        index: index_name,
        body: { settings: Scorecard.settings.to_hash, mappings: Scorecard.mappings_hash }
    end

    private
      def delete_index
        client.delete_by_query(index: index_name, q: '*'); rescue
      end

      def index_documents
        scorecards.each do |scorecard|
          scorecard.index_document_async
        end
      end

      def client
        @client ||= ::Elasticsearch::Model.client
      end
  end
end