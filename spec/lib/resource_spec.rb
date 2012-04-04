require_relative '../spec_helper'

describe DocDuck::Resource do
  subject do
    DocDuck::Resource.new( fixture_path( "redisgreen/servers" ), build_manifest )
  end

  it "returns its endpoints" do
    subject.endpoints.size.should == 2
    subject.endpoints[0].method.should == "POST"
    subject.endpoints[0].title.should == "Creates a new RedisGreen instance"
    subject.endpoints[1].method.should == "GET"
    subject.endpoints[1].title.should == "List all your RedisGreen servers"
  end

  it "returns its absolute url" do
    subject.url.should == "/servers"
  end

  it "returns all sub-resources" do
    subject.subresources.size.should == 1
    subresource = subject.subresources.first
    subresource.url.should == "/servers/:id"
    subresource.endpoints.size.should == 3
    subresource.endpoints[0].method.should == "GET"
    subresource.endpoints[0].title.should == "Get server status"
    subresource.endpoints[1].method.should == "PUT"
    subresource.endpoints[1].title.should == ""
    subresource.endpoints[2].method.should == "DELETE"
    subresource.endpoints[2].title.should == ""
  end

  it "returns iodocs json" do
    JSON.parse(subject.to_iodocs).should == {
      "endpoints" => [
        {
          "name=" => "Creates a new RedisGreen instance"
        },
        {
          "name=" => "List all your RedisGreen servers"
        }
      ]
    }
  end
end
