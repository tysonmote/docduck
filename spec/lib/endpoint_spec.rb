require_relative '../spec_helper'

describe DocDuck::Endpoint do
  subject do
    resource = DocDuck::Resource.new( fixture_path( "redisgreen/servers/:id" ), sample_manifest )
    resource.endpoints.find { |endpoint| endpoint.method == "GET" }
  end

  it "reads a endpoint file" do
    subject.method.should == "GET"
    subject.name.should == "Server status"
    subject.summary.should == "Returns the current status of a Redis server."
    subject.response_body.should == { id: "23412345", running: "true" }
    subject.params.should == {
      random: {
        type: "number",
        optional: false,
        summary: "Give us a <em>random</em> number or we'll shoot this dog."
      },
      language: {
        type: "string",
        optional: true,
        allowed: ["english", "french", "spanish"],
        summary: "Change the language of the response."
      }
    }
  end

  it "determines the url" do
    subject.url.should == "/servers/:id"
  end
end
