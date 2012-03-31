require_relative '../spec_helper'

describe DocDuck::Resource do
  subject { DocDuck::Resource.new( fixture_path( "redisgreen/servers" ), build_manifest ) }

  it "gets all endpoints" do
    subject.endpoints.size.should == 2
    subject.endpoints[0].method.should == "POST"
    subject.endpoints[0].title.should == "Creates a new RedisGreen instance"
    subject.endpoints[1].method.should == "GET"
    subject.endpoints[1].title.should == "List all your RedisGreen servers"
  end

  it "gets all sub-resources" do
    pending
    subject.subresources.should
  end
end
