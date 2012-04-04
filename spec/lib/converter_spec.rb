require_relative '../spec_helper'

describe DocDuck::Converter do
  subject do
    DocDuck::Converter.new( fixture_path( "redisgreen" ) )
  end

  it "loads all resources" do
    subject.resources.size.should == 2
    subject.resources[0].url.should == "/servers"
    subject.resources[1].url.should == "/users"
  end
end
