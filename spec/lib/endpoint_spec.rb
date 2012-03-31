require_relative '../spec_helper'

describe DocDuck::Endpoint do
  subject do
    resource = DocDuck::Resource.new( fixture_path( "redisgreen/servers/:id" ), build_manifest )
    resource.endpoints.find { |endpoint| endpoint.method == "GET" }
  end

  it "reads a endpoint file" do
    subject.method.should == "GET"
    subject.title.should == "Get server status"
    subject.summary.should == "This endpoint allows you to get the status of a RedisGreen server."
    subject.example_response.should == { id: "23412345", running: "true" }
  end

  it "determines the url" do
    subject.url.should == "/servers/:id"
  end
end
