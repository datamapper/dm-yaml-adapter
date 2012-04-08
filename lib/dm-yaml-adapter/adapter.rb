require 'yaml'
require 'dm-core'

module DataMapper
  module Adapters
    class YamlAdapter < AbstractAdapter
      # @api semipublic
      def create(resources)
        model = resources.first.model
        update_records(model) do |records|
          max_id = max_id_for(model, records)
          resources.each do |resource|
            initialize_serial(resource, max_id += 1)
            records << attributes_as_fields(resource.attributes(nil))
          end
        end
      end

      # @api semipublic
      def read(query)
        query.filter_records(records_for(query.model).dup)
      end

      # @api semipublic
      def update(attributes, collection)
        attributes = attributes_as_fields(attributes)

        update_records(collection.model) do |records|
          records_to_update = collection.query.filter_records(records.dup)
          records_to_update.each { |record| record.update(attributes) }.size
        end
      end

      # @api semipublic
      def delete(collection)
        update_records(collection.model) do |records|
          records_to_delete = collection.query.filter_records(records.dup)
          records.replace(records - records_to_delete)
          records_to_delete.size
        end
      end

      # @api semipublic
      def attributes_as_fields(attributes)
        pairs = attributes.map do |property, value|
          dumped = value.kind_of?(Module) ? value.name : property.dump(value)
          [ property.field, dumped ]
        end
        Hash[pairs]
      end

      private

      # @api semipublic
      def initialize(name, options = {})
        super
        (@path = Pathname(@options[:path]).freeze).mkpath
      end

      # Retrieves all records for a model and yields them to a block.
      #
      # The block should make any changes to the records in-place. After
      # the block executes all the records are dumped back to the file.
      #
      # @param [Model, #to_s] model
      #   Used to determine which file to read/write to
      #
      # @yieldparam [Hash]
      #   A hash of record.key => record pairs retrieved from the file
      #
      # @api private
      def update_records(model)
        records = records_for(model)
        result = yield records
        write_records(model, records)
        result
      end

      # Read all records from a file for a model
      #
      # @param [#storage_name] model
      #   The model/name to retieve records for
      #
      # @api private
      def records_for(model)
        file = yaml_file(model)
        file.readable? && YAML.load_file(file) || []
      end

      # Writes all records to a file
      #
      # @param [#storage_name] model
      #   The model/name to write the records for
      #
      # @param [Hash] records
      #   A hash of record.key => record pairs to be written
      #
      # @api private
      def write_records(model, records)
        yaml_file(model).open('w') do |fh|
          YAML.dump(records, fh)
        end
      end

      # Given a model, gives the filename to be used for record storage
      #
      # @example
      #   yaml_file(Article) #=> "/path/to/files/articles.yml"
      #
      # @param [#storage_name] model
      #   The model to be used to determine the file name.
      #
      # @api private
      def yaml_file(model)
        @path.join("#{model.storage_name(name)}.yml")
      end

      # Get the maximum id to use as a base when creating new records
      #
      # @param [DataMapper::Model] model
      #
      # @param [Hash] records
      #
      # @return [Integer]
      #
      # @api private
      def max_id_for(model, records)
        serial = model.serial(name)

        # Generating next ID
        # FIXME:
        #  * This does not work for CPK's
        #  * Inefficent for large datasets.
        if serial
          records.map { |record| record.fetch(serial.field) }.max || 0
        else
          records.size
        end
      end

    end # class YamlAdapter

    const_added(:YamlAdapter)
  end # module Adapters
end # module DataMapper
