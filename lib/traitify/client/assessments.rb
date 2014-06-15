module Traitify
  class Client
    module Assessment
      def create_assessment(options = {})
        assessment_params = { deck_id: self.deck_id }
        assessment_params.merge!(deck_id: options[:deck_id]) if options[:deck_id]
        assessment_params.merge!(user_id: options[:user_id]) if options[:user_id]
        response = post("/assessments", assessment_params)

        Hashie::Mash.new(response)
      end

      def assessment(assessment_id)
        response = get("/assessments/#{assessment_id}")

        Hashie::Mash.new(response)
      end
      alias_method :find_assessment, :assessment
    end
  end
end
