require_relative '../spec_helper'

describe DocDuck::Resource do
  subject do
    DocDuck::Resource.new( fixture_path( "redisgreen/servers" ), sample_manifest )
  end

  it "returns its endpoints" do
    subject.endpoints.size.should == 2
    subject.endpoints[0].method.should == "POST"
    subject.endpoints[0].name.should == "Create server"
    subject.endpoints[1].method.should == "GET"
    subject.endpoints[1].name.should == "Servers"
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
    subresource.endpoints[0].name.should == "Server status"
    subresource.endpoints[1].method.should == "PUT"
    subresource.endpoints[1].name.should == "Update server"
    subresource.endpoints[2].method.should == "DELETE"
    subresource.endpoints[2].name.should == "Delete server"
  end
end
