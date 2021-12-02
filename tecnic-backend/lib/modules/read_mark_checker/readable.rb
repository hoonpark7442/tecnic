module ReadMarkChecker
  module Readable
    module ClassMethods
      # target -> array
      def mark_as_read!(target, options)
        raise ArgumentError unless options.is_a?(Hash)

        reader = options[:for]
        assert_reader(reader)

        if target == :all
          # reset_read_marks_for_user(reader)
          raise ArgumentError, "아직 지원하지 않습니다."
        elsif target.respond_to?(:each)
          mark_collection_as_read(target, reader)
        else
          raise ArgumentError
        end
      end

      def mark_collection_as_read(collection, reader)
        ReadMark.transaction do
          collection.each do |obj|
            begin
              obj.read_marks.create!(user_id: reader.id)
            rescue ActiveRecord::RecordNotUnique, ActiveRecord::RecordInvalid
              # The object is explicitly marked as read, so there is nothing to do
            end
          end
        end
      end

      def assert_reader(reader)
        raise ArgumentError, "해당하는 유저가 없습니다." if reader.nil?
        raise ArgumentError, "The given reader has no id." unless reader.id
      end
    end

    module InstanceMethods
      def unread?(reader)
        return true if read_marks.find_by(user_id: reader.id).nil?
        false
      end

      def mark_as_read!(options)
        reader = options[:for]
        self.class.assert_reader(reader)

        ReadMark.transaction do
          if unread?(reader)
            read_marks.create!(user_id: reader.id)
            # begin
            #   read_marks.create!(user_id: "")
            # rescue ActiveRecord::RecordNotUnique, ActiveRecord::RecordInvalid
            #   # The object is explicitly marked as read, so there is nothing to do
            #   puts "hoo"
            # rescue => e
            #   puts "hoonkj"
            #   render json: {
            #     message: e.message
            #   }, status: :unprocessable_entity
            # end
            
          end
        end
      end
    end
  end
end