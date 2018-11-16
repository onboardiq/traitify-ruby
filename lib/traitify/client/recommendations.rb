module Traitify
  class Client
    module Recommendation
      def recommendations(options = {})
        get("/assessments/recommendations", options).collect do |recommendation|
          Hashie::Mash.new(recommendation)
        end
      end
      alias_method :find_recommendations, :recommendations
    end
  end
end
