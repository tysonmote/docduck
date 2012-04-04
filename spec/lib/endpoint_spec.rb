# encoding: UTF-8
require_relative '../spec_helper'

describe DocDuck::Endpoint do
  subject do
    resource = DocDuck::Resource.new( "Servers", fixture_path( "redisgreen/servers/:id" ), sample_manifest )
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

  it "renders HTML" do
    subject.to_html.should == <<-HTML.strip
<article class="docduck-endpoint">
  <h1>
    <span class="docduck-method">GET</span> <span class="docduck-name">Server status</span> <span class="docduck-url">&#47;servers&#47;:id</span>
  </h1>
  <div class="docduck-summary"><p>Returns the current status of a Redis server.</p></div>
  <table class="docduck-params">
    <thead>
      <tr>
        <th>Name</th>
        <th>Type</th>
        <th>Required</th>
        <th>Notes</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <th class="docduck-param-name">random</th>
        <td class="docduck-param-type">number</td>
        <td class="docduck-param-optional">√</td>
        <td class="docduck-param-notes">Give us a <em>random</em> number or we'll shoot this dog.</td>
      </tr>
      <tr>
        <th class="docduck-param-name">language</th>
        <td class="docduck-param-type">string</td>
        <td class="docduck-param-optional"></td>
        <td class="docduck-param-notes">Change the language of the response.</td>
      </tr>
    </tbody>
  </table>
</article>
HTML
  end
end
