require_relative '../spec_helper'

describe DocDuck::Manifest do
  subject { sample_manifest }

  it 'parses a manifest file' do
    subject.title.should == "RedisGreen's *Cool* API"
    subject.title_html.should == "RedisGreen's <em>Cool</em> API"
    subject.summary.should == <<-TXT.strip
This documentation describes the RedisGreen API. It is a REST-ful API that
accepts and returns JSON.

Kickin' rad.
TXT
    subject.summary_html.should == <<-TXT.strip
<p>This documentation describes the RedisGreen API. It is a REST-ful API that
accepts and returns JSON.</p>

<p>Kickin' rad.</p>
TXT
    subject.dirname.should == fixture_path( "redisgreen" )
  end

  it 'returns the order of files to be parsed'

end
