require "spec_helper"

describe Traitify::Client do
  before do
    Traitify.configure do |tom|
      tom.secret_key = "secret"
      tom.host = "https://example.com"
      tom.version = "v1"
    end
  end

  let(:tom) { Traitify.new }

  describe ".recommendations" do
    context "without params" do
      let(:recommendations) { tom.recommendations }

      before(:each) do
        stub_it(:get, "/assessments/recommendations?locale_key=en-us", "recommendations")
      end

      it "returns recommendations" do
        expect(recommendations.first.name).to eq("Delivery Driver")
      end
    end
  end
end
