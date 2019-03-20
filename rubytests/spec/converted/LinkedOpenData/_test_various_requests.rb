shared_examples "Linked Open Data: Test Various Requests" do
  it "Ask for various types of RDF by URL or Format" do
    vivo_login_from_home_page_as("testAdmin@mydomain.edu", "Password")
    expect($browser.title).to eq("VIVO")
    #<tr><td>open</td><td>/testApp/TestLinkedOpenData.html</td><td></td></tr>
  end

  it "Pause to check results" do
    # #<tr><td>pause</td><td>10000</td><td></td></tr>
  end

  it "TEST ALL REQUEST FIELDS" do
    $browser.find_element(:id, "N3_EXTENSION_button").click
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    expect(browser_page_text).to include("Request URL is /vivo/individual/lodFacultyMember/lodFacultyMember.n3")
    expect(browser_page_text).to include("Accept header is No header")
    expect(browser_page_text).to include("Response code is 200")
    expect(browser_page_text).to include("MIME type is text/n3")
    expect(browser_page_text).to include("Text is:")
    expect(browser_page_text).to include("@prefix")
    expect(browser_page_text).to include("<http://vivo.mydomain.edu/individual/lodFacultyMember>")
    expect(browser_page_text).to include("rdfs:label \"Example, Bad \"^^xsd:string")
    expect(browser_page_text).to include("obo:ARG_2000028")
    expect(browser_page_text).to include("obo:RO_0000053")
    expect(browser_page_text).to include("vivo:overview \"Not someone on whom you should base your actions.\"")
    expect(browser_page_text).to include("rdfs:label \"Faculty Member\"@en-US")
    expect(browser_page_text).to include("rdfs:label \"Person\"@en-US")
    expect(browser_page_text).to include("<http://vivo.mydomain.edu/individual/lodMembership>")
    expect(browser_page_text).to include("rdfs:label \"Bozo\"^^xsd:string")
    expect(browser_page_text).to include("<http://localhost:8080/vivo/individual/lodFacultyMember/lodFacultyMember.n3>")
    expect(browser_page_text).to include("<http://vivo.mydomain.edu/termsOfUse>")
  end

  it "Pause to check results" do
    # #<tr><td>pause</td><td>10000</td><td></td></tr>
  end

  it "TEST REQUEST BY EXTENSION" do
    #<tr><td>open</td><td>/testApp/TestLinkedOpenData.html</td><td></td></tr>
    $browser.find_element(:id, "RDFXML_EXTENSION_button").click
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    expect(browser_page_text).to include("Request URL is /vivo/individual/lodFacultyMember/lodFacultyMember.rdf")
    expect(browser_page_text).to include("Accept header is No header")
    expect(browser_page_text).to include("Response code is 200")
    expect(browser_page_text).to include("MIME type is application/rdf+xml")
    expect(browser_page_text).to include("Text is:")
    expect(browser_page_text).to include("<rdf:RDF")
  end

  it "Pause to check results" do
    # #<tr><td>pause</td><td>10000</td><td></td></tr>
  end

  it "---" do
    $browser.find_element(:id, "CLEAR_RESPONSE_button").click
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    expect(browser_page_text).to include("Response code is 000")
    expect(browser_page_text).to include("MIME type is No type")
    expect(browser_page_text).to include("Text is:")
    expect(browser_page_text).to include("No text")
  end

  it "---" do
    $browser.find_element(:id, "N3_EXTENSION_button").click
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    expect(browser_page_text).to include("Request URL is /vivo/individual/lodFacultyMember/lodFacultyMember.n3")
    expect(browser_page_text).to include("Accept header is No header")
    expect(browser_page_text).to include("Response code is 200")
    expect(browser_page_text).to include("MIME type is text/n3")
    expect(browser_page_text).to include("Text is:")
    expect(browser_page_text).to include("@prefix")
  end

  it "Pause to check results" do
    # #<tr><td>pause</td><td>10000</td><td></td></tr>
  end

  it "---" do
    $browser.find_element(:id, "CLEAR_RESPONSE_button").click
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    expect(browser_page_text).to include("Response code is 000")
    expect(browser_page_text).to include("MIME type is No type")
    expect(browser_page_text).to include("Text is:")
    expect(browser_page_text).to include("No text")
  end

  it "---" do
    $browser.find_element(:id, "TTL_EXTENSION_button").click
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    expect(browser_page_text).to include("Request URL is /vivo/individual/lodFacultyMember/lodFacultyMember.ttl")
    expect(browser_page_text).to include("Accept header is No header")
    expect(browser_page_text).to include("Response code is 200")
    expect(browser_page_text).to include("MIME type is text/turtle")
    expect(browser_page_text).to include("Text is:")
    expect(browser_page_text).to include("@prefix")
  end

  it "Pause to check results" do
    # #<tr><td>pause</td><td>10000</td><td></td></tr>
  end

  it "---" do
    $browser.find_element(:id, "CLEAR_RESPONSE_button").click
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    expect(browser_page_text).to include("Response code is 000")
    expect(browser_page_text).to include("MIME type is No type")
    expect(browser_page_text).to include("Text is:")
    expect(browser_page_text).to include("No text")
  end

  it "---" do
    $browser.find_element(:id, "JSONLD_EXTENSION_button").click
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    expect(browser_page_text).to include("Request URL is /vivo/individual/lodFacultyMember/lodFacultyMember.jsonld")
    expect(browser_page_text).to include("Accept header is No header")
    expect(browser_page_text).to include("Response code is 200")
    expect(browser_page_text).to include("MIME type is application/json")
    expect(browser_page_text).to include("Text is:")
    expect(browser_page_text).to include("[{\"@id\":\"http://localhost:8080/vivo/individual/lodFacultyMember/lodFacultyMember.jsonld\"")
  end

  it "Pause to check results" do
    # #<tr><td>pause</td><td>10000</td><td></td></tr>
  end

  it "---" do
    $browser.find_element(:id, "CLEAR_RESPONSE_button").click
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    expect(browser_page_text).to include("Response code is 000")
    expect(browser_page_text).to include("MIME type is No type")
    expect(browser_page_text).to include("Text is:")
    expect(browser_page_text).to include("No text")
  end

  it "TEST REQUEST BY FORMAT PARAMETERS" do
    $browser.find_element(:id, "RDFXML_FORMAT_button").click
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    expect(browser_page_text).to include("Request URL is /vivo/individual/lodFacultyMember?format=rdfxml")
    expect(browser_page_text).to include("Accept header is No header")
    expect(browser_page_text).to include("Response code is 200")
    expect(browser_page_text).to include("MIME type is application/rdf+xml")
    expect(browser_page_text).to include("Text is:")
    expect(browser_page_text).to include("<rdf:RDF")
  end

  it "Pause to check results" do
    # #<tr><td>pause</td><td>10000</td><td></td></tr>
  end

  it "---" do
    $browser.find_element(:id, "CLEAR_RESPONSE_button").click
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    expect(browser_page_text).to include("Response code is 000")
    expect(browser_page_text).to include("MIME type is No type")
    expect(browser_page_text).to include("Text is:")
    expect(browser_page_text).to include("No text")
  end

  it "---" do
    $browser.find_element(:id, "N3_FORMAT_button").click
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    expect(browser_page_text).to include("Request URL is /vivo/individual/lodFacultyMember")
    expect(browser_page_text).to include("Accept header is No header")
    expect(browser_page_text).to include("Response code is 200")
    expect(browser_page_text).to include("MIME type is text/n3")
    expect(browser_page_text).to include("Text is:")
    expect(browser_page_text).to include("@prefix")
  end

  it "Pause to check results" do
    # #<tr><td>pause</td><td>10000</td><td></td></tr>
  end

  it "---" do
    $browser.find_element(:id, "CLEAR_RESPONSE_button").click
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    expect(browser_page_text).to include("Response code is 000")
    expect(browser_page_text).to include("MIME type is No type")
    expect(browser_page_text).to include("Text is:")
    expect(browser_page_text).to include("No text")
  end

  it "---" do
    $browser.find_element(:id, "TTL_FORMAT_button").click
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    expect(browser_page_text).to include("Request URL is /vivo/individual/lodFacultyMember")
    expect(browser_page_text).to include("Accept header is No header")
    expect(browser_page_text).to include("Response code is 200")
    expect(browser_page_text).to include("MIME type is text/turtle")
    expect(browser_page_text).to include("Text is:")
    expect(browser_page_text).to include("@prefix")
  end

  it "Pause to check results" do
    # #<tr><td>pause</td><td>10000</td><td></td></tr>
  end

  it "---" do
    $browser.find_element(:id, "CLEAR_RESPONSE_button").click
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    expect(browser_page_text).to include("Response code is 000")
    expect(browser_page_text).to include("MIME type is No type")
    expect(browser_page_text).to include("Text is:")
    expect(browser_page_text).to include("No text")
  end

  it "---" do
    $browser.find_element(:id, "JSONLD_FORMAT_button").click
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    expect(browser_page_text).to include("Request URL is /vivo/individual/lodFacultyMember")
    expect(browser_page_text).to include("Accept header is No header")
    expect(browser_page_text).to include("Response code is 200")
    expect(browser_page_text).to include("MIME type is application/json")
    expect(browser_page_text).to include("Text is:")
    expect(browser_page_text).to include("[{\"@id\":\"http://localhost:8080/vivo/individual/lodFacultyMember\"")
  end

  it "Pause to check results" do
    # #<tr><td>pause</td><td>10000</td><td></td></tr>
  end

  it "---" do
    $browser.find_element(:id, "CLEAR_RESPONSE_button").click
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    expect(browser_page_text).to include("Response code is 000")
    expect(browser_page_text).to include("MIME type is No type")
    expect(browser_page_text).to include("Text is:")
    expect(browser_page_text).to include("No text")
  end

  it "TEST REQUEST BY ACCEPT HEADERS" do
    $browser.find_element(:id, "RDFXML_HEADER_button").click
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    expect(browser_page_text).to include("Request URL is /vivo/individual/lodFacultyMember")
    expect(browser_page_text).to include("Accept header is application/rdf+xml")
    expect(browser_page_text).to include("Response code is 200")
    expect(browser_page_text).to include("MIME type is application/rdf+xml")
    expect(browser_page_text).to include("Text is:")
    expect(browser_page_text).to include("<rdf:RDF")
  end

  it "Pause to check results" do
    # #<tr><td>pause</td><td>10000</td><td></td></tr>
  end

  it "---" do
    $browser.find_element(:id, "CLEAR_RESPONSE_button").click
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    expect(browser_page_text).to include("Response code is 000")
    expect(browser_page_text).to include("MIME type is No type")
    expect(browser_page_text).to include("Text is:")
    expect(browser_page_text).to include("No text")
  end

  it "---" do
    $browser.find_element(:id, "N3_HEADER_button").click
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    expect(browser_page_text).to include("Request URL is /vivo/individual/lodFacultyMember")
    expect(browser_page_text).to include("Accept header is text/n3")
    expect(browser_page_text).to include("Response code is 200")
    expect(browser_page_text).to include("MIME type is text/n3")
    expect(browser_page_text).to include("Text is:")
    expect(browser_page_text).to include("@prefix")
  end

  it "Pause to check results" do
    # #<tr><td>pause</td><td>10000</td><td></td></tr>
  end

  it "---" do
    $browser.find_element(:id, "CLEAR_RESPONSE_button").click
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    expect(browser_page_text).to include("Response code is 000")
    expect(browser_page_text).to include("MIME type is No type")
    expect(browser_page_text).to include("Text is:")
    expect(browser_page_text).to include("No text")
  end

  it "---" do
    $browser.find_element(:id, "TTL_HEADER_button").click
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    expect(browser_page_text).to include("Request URL is /vivo/individual/lodFacultyMember")
    expect(browser_page_text).to include("Accept header is text/turtle")
    expect(browser_page_text).to include("Response code is 200")
    expect(browser_page_text).to include("MIME type is text/turtle")
    expect(browser_page_text).to include("Text is:")
    expect(browser_page_text).to include("@prefix")
  end

  it "Pause to check results" do
    # #<tr><td>pause</td><td>10000</td><td></td></tr>
  end

  it "---" do
    $browser.find_element(:id, "CLEAR_RESPONSE_button").click
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    expect(browser_page_text).to include("Response code is 000")
    expect(browser_page_text).to include("MIME type is No type")
    expect(browser_page_text).to include("Text is:")
    expect(browser_page_text).to include("No text")
  end

  it "---" do
    $browser.find_element(:id, "JSONLD_HEADER_button").click
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    expect(browser_page_text).to include("Request URL is /vivo/individual/lodFacultyMember")
    expect(browser_page_text).to include("Accept header is application/json")
    expect(browser_page_text).to include("Response code is 200")
    expect(browser_page_text).to include("MIME type is application/json")
    expect(browser_page_text).to include("Text is:")
    expect(browser_page_text).to include("[{\"@id\":\"http://localhost:8080/vivo/individual/lodFacultyMember/lodFacultyMember.jsonld\"")
  end

  it "Pause to check results" do
    # #<tr><td>pause</td><td>10000</td><td></td></tr>
  end

  it "---" do
    $browser.find_element(:id, "CLEAR_RESPONSE_button").click
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    expect(browser_page_text).to include("Response code is 000")
    expect(browser_page_text).to include("MIME type is No type")
    expect(browser_page_text).to include("Text is:")
    expect(browser_page_text).to include("No text")
  end

  it "TEST INVALID REQUESTS" do
    $browser.find_element(:id, "BOGUS_URI_button").click
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    expect($browser.find_element(:id, "requestUrl").text).to eq("/vivo/individual/lodFacultyMemberXX")
    expect($browser.find_element(:id, "acceptHeader").text).to eq("application/rdf+xml")
    expect($browser.find_element(:xpath, ".//div[3]").text).to eq("Response code is 404")
    expect($browser.find_element(:xpath, ".//div[4]").text).to eq("MIME type is application/rdf+xml")
    expect($browser.find_element(:xpath, ".//div[5]").text).to eq("Text is:")
    expect(browser_page_text).to include("<!DOCTYPE html>")
    expect(browser_page_text).to include("Individual Not Found")
  end

  it "---" do
    $browser.find_element(:id, "CLEAR_RESPONSE_button").click
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    expect($browser.find_element(:id, "requestUrl").text).to eq("/vivo/individual/lodFacultyMemberXX")
    expect($browser.find_element(:xpath, ".//div[2]").text).to eq("Accept header is application/rdf+xml")
    expect($browser.find_element(:xpath, ".//div[3]").text).to eq("Response code is 000")
    expect($browser.find_element(:xpath, ".//div[4]").text).to eq("MIME type is No type")
    expect($browser.find_element(:xpath, ".//div[5]").text).to eq("Text is:")
    expect($browser.find_element(:id, "responseText").text).to eq("No text")
  end

  it "---" do
    $browser.find_element(:id, "BOGUS_ACCEPT_button").click
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    expect($browser.find_element(:css, "div").text).to eq("Request URL is /vivo/individual/lodFacultyMember")
    expect($browser.find_element(:xpath, ".//div[2]").text).to eq("Accept header is image/png")
    expect($browser.find_element(:xpath, ".//div[3]").text).to eq("Response code is 200")
    expect($browser.find_element(:xpath, ".//div[4]").text).to eq("MIME type is text/html")
    expect($browser.find_element(:xpath, ".//div[5]").text).to eq("Text is:")
    expect(browser_page_text).to include("<!DOCTYPE html>")
    expect(browser_page_text).to include("Example, Bad")
  end

  it "---" do
    $browser.find_element(:id, "CLEAR_RESPONSE_button").click
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    expect($browser.find_element(:css, "div").text).to eq("Request URL is /vivo/individual/lodFacultyMember")
    expect($browser.find_element(:xpath, ".//div[2]").text).to eq("Accept header is image/png")
    expect($browser.find_element(:xpath, ".//div[3]").text).to eq("Response code is 000")
    expect($browser.find_element(:xpath, ".//div[4]").text).to eq("MIME type is No type")
    expect($browser.find_element(:xpath, ".//div[5]").text).to eq("Text is:")
    expect($browser.find_element(:id, "responseText").text).to eq("No text")
  end

  it "---" do
    $browser.find_element(:id, "BOGUS_FORMAT_button").click
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    expect($browser.find_element(:css, "div").text).to eq("exact:Request URL is /vivo/individual/lodFacultyMember?format=bogus")
    expect($browser.find_element(:xpath, ".//div[2]").text).to eq("Accept header is No header")
    expect($browser.find_element(:xpath, ".//div[3]").text).to eq("Response code is 200")
    expect($browser.find_element(:xpath, ".//div[4]").text).to eq("MIME type is text/html")
    expect($browser.find_element(:xpath, ".//div[5]").text).to eq("Text is:")
    expect(browser_page_text).to include("<!DOCTYPE html>")
    expect(browser_page_text).to include("Example, Bad")
  end

  it "---" do
    $browser.find_element(:id, "CLEAR_RESPONSE_button").click
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    expect($browser.find_element(:id, "requestUrl").text).to eq("exact:/vivo/individual/lodFacultyMember?format=bogus")
    expect($browser.find_element(:xpath, ".//div[2]").text).to eq("Accept header is No header")
    expect($browser.find_element(:xpath, ".//div[3]").text).to eq("Response code is 000")
    expect($browser.find_element(:xpath, ".//div[4]").text).to eq("MIME type is No type")
    expect($browser.find_element(:xpath, ".//div[5]").text).to eq("Text is:")
    expect($browser.find_element(:id, "responseText").text).to eq("No text")
  end

  it "---" do
    $browser.find_element(:id, "BOGUS_EXTENSION_button").click
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    expect($browser.find_element(:id, "requestUrl").text).to eq("/vivo/individual/lodFacultyMember/lodFacultyMember.bogus")
    expect($browser.find_element(:xpath, ".//div[2]").text).to eq("Accept header is No header")
    expect($browser.find_element(:xpath, ".//div[3]").text).to eq("Response code is 404")
    expect($browser.find_element(:xpath, ".//div[4]").text).to eq("MIME type is text/html")
    expect($browser.find_element(:xpath, ".//div[5]").text).to eq("Text is:")
    expect(browser_page_text).to include("<!DOCTYPE html>")
    expect(browser_page_text).to include("Individual Not Found")
  end

  it "---" do
    $browser.find_element(:id, "CLEAR_RESPONSE_button").click
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    expect($browser.find_element(:id, "requestUrl").text).to eq("/vivo/individual/lodFacultyMember/lodFacultyMember.bogus")
    expect($browser.find_element(:xpath, ".//div[2]").text).to eq("Accept header is No header")
    expect($browser.find_element(:xpath, ".//div[3]").text).to eq("Response code is 000")
    expect($browser.find_element(:xpath, ".//div[4]").text).to eq("MIME type is No type")
    expect($browser.find_element(:xpath, ".//div[5]").text).to eq("Text is:")
    expect($browser.find_element(:id, "responseText").text).to eq("No text")
  end

  it "LOGOFF" do
    $browser.navigate.to vivo_url("/")
    vivo_logout
    end
  end
