shared_examples "Admin Security: New Admin Check Privileges" do
  it "Check privileges for new admin account" do
    $browser.navigate.to vivo_url("/")
    expect($browser.title).to eq("VIVO")
  end

  it "Must not be logged in already" do
    $browser.find_element(:link_text, "Log in").click
    expect($browser.title).to eq("Log in - VIVO")
    expect(browser_page_text).to include("Log in")
  end

  it "Login as new Admin" do
    $browser.find_element(:name, "loginName").clear
    $browser.find_element(:name, "loginName").send_keys("SisAdmin@mydomain.edu")
    $browser.find_element(:name, "loginPassword").clear
    $browser.find_element(:name, "loginPassword").send_keys("newPassword")
    $browser.find_element(:name, "loginForm").click
  end

  it "Verify new account is logged in and has access to correct options" do
    expect($browser.title).to eq("VIVO")
    expect(browser_page_text).to include("Sis")
    $browser.find_element(:link_text, "Site Admin").click
    expect($browser.title).to eq("VIVO Site Administration")
  end

  it "Verify available options" do
    expect(browser_page_text).to include("Site Administration")
    expect(browser_page_text).to include("Data Input")
    expect($browser.find_element(:id, "submit")["value"]).to eq("Add individual of this class")
    expect(browser_page_text).to include("Site Configuration")
    $browser.find_element(:link_text, "Institutional internal class")
    $browser.find_element(:link_text, "Manage profile editing")
    $browser.find_element(:link_text, "Page management")
    $browser.find_element(:link_text, "Menu ordering")
    $browser.find_element(:link_text, "Site information")
    $browser.find_element(:link_text, "User accounts")
    expect(browser_page_text).to include("Ontology Editor")
    $browser.find_element(:link_text, "Ontology list")
    expect(browser_page_text).to include("Class Management")
    $browser.find_element(:link_text, "Class hierarchy")
    $browser.find_element(:link_text, "Class groups")
    expect(browser_page_text).to include("Property Management")
    $browser.find_element(:link_text, "Object property hierarchy")
    $browser.find_element(:link_text, "Data property hierarchy")
    $browser.find_element(:link_text, "Property groups")
    expect(browser_page_text).to include("Advanced Data Tools")
    $browser.find_element(:link_text, "Add/Remove RDF data")
    $browser.find_element(:link_text, "Ingest tools")
    $browser.find_element(:link_text, "RDF export")
    $browser.find_element(:link_text, "SPARQL query")
    expect(browser_page_text).to include("Site Maintenance")
    $browser.find_element(:link_text, "Rebuild search index")
    $browser.find_element(:link_text, "Rebuild visualization cache")
    $browser.find_element(:link_text, "Recompute inferences")
    $browser.find_element(:link_text, "Startup status")
    $browser.find_element(:link_text, "Restrict logins")
    $browser.find_element(:link_text, "Activate developer panel")
  end

  it "Make sure available Site Configuration options actually open up" do
    $browser.find_element(:link_text, "Institutional internal class").click
    expect($browser.title).to eq("VIVO")
    expect(browser_page_text).to include("Institutional Internal Class")
    expect(browser_page_text).to include("There are currently no recognized local ontologies.")
    expect(browser_page_text).not_to include("We're sorry, but you are not authorized to view the page you requested. If you think this is an error, please contact us and we'll be happy to help.")
    $browser.find_element(:link_text, "Site Admin").click
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "Manage profile editing").click
    expect($browser.title).to eq("VIVO")
    expect(browser_page_text).to include("Manage profile editing")
    expect(browser_page_text).to include("Relate profile editors and profiles")
    expect(browser_page_text).to include("Select editors")
    expect(browser_page_text).to include("Select profiles")
    expect(browser_page_text).to include("Profile editors")
    expect(browser_page_text).not_to include("We're sorry, but you are not authorized to view the page you requested. If you think this is an error, please contact us and we'll be happy to help.")
    $browser.find_element(:link_text, "Site Admin").click
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "Page management").click
    expect($browser.title).to eq("Pages")
    expect(browser_page_text).to include("Page management")
    expect(browser_page_text).to include("Title")
    expect(browser_page_text).to include("URL")
    expect(browser_page_text).to include("Custom Template")
    expect(browser_page_text).to include("Menu Page")
    expect(browser_page_text).to include("Controls")
    expect(browser_page_text).to include("Home")
    expect(browser_page_text).to include("Use Menu Ordering to set the order of menu items.")
    $browser.find_element(:id, "menuMgmtLink")
    expect(browser_page_text).not_to include("We're sorry, but you are not authorized to view the page you requested. If you think this is an error, please contact us and we'll be happy to help.")
    $browser.find_element(:link_text, "Site Admin").click
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "Menu ordering").click
    expect($browser.title).to eq("Default Menu")
    expect(browser_page_text).to include("Menu Ordering")
    expect(browser_page_text).to include("Home")
    expect(browser_page_text).to include("People")
    expect(browser_page_text).to include("Organizations")
    expect(browser_page_text).to include("Research")
    expect(browser_page_text).to include("Events")
    expect(browser_page_text).to include("Refresh page after reordering menu items")
    expect(browser_page_text).not_to include("We're sorry, but you are not authorized to view the page you requested. If you think this is an error, please contact us and we'll be happy to help.")
    $browser.find_element(:link_text, "Site Admin").click
    $browser.find_element(:link_text, "Site information").click
    expect($browser.title).to eq("Site Information")
    expect(browser_page_text).to include("Site Information")
    expect(browser_page_text).to include("Editing Existing Record")
    expect(browser_page_text).to include("Site name (max 50 characters)")
    expect(browser_page_text).to include("Contact email address contact form submissions will be sent to this address")
    expect(browser_page_text).to include("Theme")
    expect(browser_page_text).to include("Copyright text used in footer (e.g., name of your institution)")
    expect(browser_page_text).to include("Copyright URL copyright text links to this URL")
    expect(browser_page_text).not_to include("We're sorry, but you are not authorized to view the page you requested. If you think this is an error, please contact us and we'll be happy to help.")
    $browser.find_element(:link_text, "Site Admin").click
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "Startup status").click
    expect($browser.title).to eq("Startup status")
    expect(browser_page_text).to include("Startup trace")
    expect(browser_page_text).to include("The full list of startup events and messages.")
    expect(browser_page_text).not_to include("We're sorry, but you are not authorized to view the page you requested. If you think this is an error, please contact us and we'll be happy to help.")
    $browser.find_element(:link_text, "Site Admin").click
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "User accounts").click
    expect($browser.title).to eq("VIVO")
    expect(browser_page_text).to include("User accounts")
    expect(browser_page_text).to include("Email Address")
    expect(browser_page_text).to include("First name")
    expect(browser_page_text).to include("Last name")
    expect(browser_page_text).to include("Status")
    expect(browser_page_text).to include("Roles")
    expect(browser_page_text).to include("Login count")
    expect(browser_page_text).to include("Last Login")
    $browser.find_element(:link_text, "testAdmin@mydomain.edu")
    expect(browser_page_text).not_to include("We're sorry, but you are not authorized to view the page you requested. If you think this is an error, please contact us and we'll be happy to help.")
    $browser.find_element(:link_text, "Site Admin").click
    expect($browser.title).to eq("VIVO Site Administration")
  end

  it "Make sure available Ontology Editor options actually open up" do
    $browser.find_element(:link_text, "Ontology list").click
    expect($browser.title).to eq("Ontologies")
    expect(browser_page_text).to include("Ontologies")
    expect($browser.find_element(:css, "input.form-button")["value"]).to eq("Add new ontology")
    expect(browser_page_text).to include("Ontology")
    expect(browser_page_text).to include("Namespace")
    expect(browser_page_text).to include("Prefix")
    $browser.find_element(:link_text, "VIVO Core Ontology")
    expect(browser_page_text).not_to include("We're sorry, but you are not authorized to view the page you requested. If you think this is an error, please contact us and we'll be happy to help.")
    $browser.find_element(:link_text, "Site Admin").click
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "Class hierarchy").click
    expect($browser.title).to eq("VIVO")
    expect(browser_page_text).to include("Asserted Class Hierarchy")
    expect(browser_page_text).to include("Display Options")
    expect($browser.find_element(:id, "addClass")["value"]).to eq("Add New Class")
    $browser.find_element(:link_text, "expand all")
    expect(browser_page_text).to include("Ontology")
    expect(browser_page_text).to include("Subclasses")
    expect(browser_page_text).not_to include("We're sorry, but you are not authorized to view the page you requested. If you think this is an error, please contact us and we'll be happy to help.")
    $browser.find_element(:link_text, "Site Admin").click
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "Class groups").click
    expect($browser.title).to eq("VIVO")
    expect(browser_page_text).to include("Class Groups")
    expect(browser_page_text).to include("Display Options")
    $browser.find_element(:id, "addClass")
    $browser.find_element(:id, "addGroup")
    $browser.find_element(:link_text, "hide subclasses")
    $browser.find_element(:link_text, "people")
    expect(browser_page_text).to include("Display Rank:")
    expect(browser_page_text).to include("Classes:")
    expect(browser_page_text).not_to include("We're sorry, but you are not authorized to view the page you requested. If you think this is an error, please contact us and we'll be happy to help.")
    $browser.find_element(:link_text, "Site Admin").click
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "Object property hierarchy").click
    expect($browser.title).to eq("VIVO")
    expect(browser_page_text).to include("Object Property Hierarchy")
    expect(browser_page_text).to include("Display Options")
    $browser.find_element(:link_text, "expand all")
    $browser.find_element(:link_text, "access provided by (scires)")
    expect(browser_page_text).to include("Local Name:")
    expect(browser_page_text).to include("Group:")
    expect(browser_page_text).to include("Domain Class:")
    expect(browser_page_text).to include("Range Class:")
    expect(browser_page_text).not_to include("We're sorry, but you are not authorized to view the page you requested. If you think this is an error, please contact us and we'll be happy to help.")
    $browser.find_element(:link_text, "Site Admin").click
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "Data property hierarchy").click
    expect($browser.title).to eq("VIVO")
    expect(browser_page_text).to include("Data Property Hierarchy")
    expect(browser_page_text).to include("Display Options")
    $browser.find_element(:id, "addProperty")
    $browser.find_element(:link_text, "expand all")
    $browser.find_element(:link_text, "abbreviation (vivo)")
    expect(browser_page_text).to include("Local Name:")
    expect(browser_page_text).to include("Group:")
    expect(browser_page_text).to include("Domain Class:")
    expect(browser_page_text).to include("Range Data Type:")
    expect(browser_page_text).not_to include("We're sorry, but you are not authorized to view the page you requested. If you think this is an error, please contact us and we'll be happy to help.")
    $browser.find_element(:link_text, "Site Admin").click
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "Property groups").click
    expect($browser.title).to eq("VIVO")
    expect(browser_page_text).to include("Property Groups")
    $browser.find_element(:id, "addProperty")
    $browser.find_element(:link_text, "hide properties")
    $browser.find_element(:link_text, "contact")
    expect(browser_page_text).to include("Display Rank:")
    expect(browser_page_text).to include("Properties:")
    expect(browser_page_text).not_to include("We're sorry, but you are not authorized to view the page you requested. If you think this is an error, please contact us and we'll be happy to help.")
    $browser.find_element(:link_text, "Site Admin").click
    expect($browser.title).to eq("VIVO Site Administration")
  end

  it "Make sure available Advanced Data Tools options actually open up" do
    $browser.find_element(:link_text, "Add/Remove RDF data").click
    expect($browser.title).to eq("Ingest RDF Data")
    expect(browser_page_text).to include("Add or Remove RDF Data")
    expect(browser_page_text).to include("Enter Web-accessible URL of document containing RDF to add or remove:")
    expect(browser_page_text).to include("Or upload a file from your computer:")
    $browser.find_element(:name, "rdfStream")
    expect(browser_page_text).to include("add instance data (supports large data files)")
    expect(browser_page_text).to include("add mixed RDF (instances and/or ontology)")
    expect(browser_page_text).to include("remove mixed RDF (instances and/or ontology)")
    expect(browser_page_text).to include("create classgroups automatically")
    $browser.find_element(:id, "submit")
    expect(browser_page_text).not_to include("We're sorry, but you are not authorized to view the page you requested. If you think this is an error, please contact us and we'll be happy to help.")
    $browser.find_element(:link_text, "Site Admin").click
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "Ingest tools").click
    expect($browser.title).to eq("Ingest Menu")
    expect(browser_page_text).to include("Ingest Menu")
    $browser.find_element(:link_text, "Manage Jena Models")
    $browser.find_element(:link_text, "Subtract One Model from Another")
    $browser.find_element(:link_text, "Convert CSV to RDF")
    $browser.find_element(:link_text, "Convert XML to RDF")
    $browser.find_element(:link_text, "Execute SPARQL CONSTRUCT")
    $browser.find_element(:link_text, "Generate TBox")
    $browser.find_element(:link_text, "Name Blank Nodes")
    $browser.find_element(:link_text, "Smush Resources")
    $browser.find_element(:link_text, "Merge Resources")
    $browser.find_element(:link_text, "Change Namespace of Resources")
    $browser.find_element(:link_text, "Process Property Value Strings")
    $browser.find_element(:link_text, "Split Property Value Strings into Multiple Property Values")
    $browser.find_element(:link_text, "Execute Workflow")
    $browser.find_element(:link_text, "Dump or Restore the knowledge base")
    expect(browser_page_text).not_to include("We're sorry, but you are not authorized to view the page you requested. If you think this is an error, please contact us and we'll be happy to help.")
    $browser.find_element(:link_text, "Site Admin").click
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "RDF export").click
    expect($browser.title).to eq("VIVO")
    expect(browser_page_text).to include("Export to RDF")
    expect(browser_page_text).to include("Select format")
    $browser.find_element(:name, "submit")
    expect(browser_page_text).not_to include("We're sorry, but you are not authorized to view the page you requested. If you think this is an error, please contact us and we'll be happy to help.")
    $browser.find_element(:link_text, "Site Admin").click
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "SPARQL query").click
    expect($browser.title).to eq("SPARQL Query")
    expect(browser_page_text).to include("SPARQL Query")
    expect(browser_page_text).to include("Query:")
    expect(browser_page_text).to include("Format for SELECT and ASK query results:")
    expect(browser_page_text).to include("Format for CONSTRUCT and DESCRIBE query results:")
    expect(browser_page_text).not_to include("We're sorry, but you are not authorized to view the page you requested. If you think this is an error, please contact us and we'll be happy to help.")
    $browser.find_element(:link_text, "Site Admin").click
    expect($browser.title).to eq("VIVO Site Administration")
  end

  it "Make sure available Refresh Content options actually open up" do
    $browser.find_element(:link_text, "Rebuild search index").click
    expect($browser.title).to eq("Rebuild Search Index")
    expect(browser_page_text).to include("Search Index Status")
    expect(browser_page_text).to include("The search indexer has been idle since")
    $browser.find_element(:name, "rebuild")
    expect(browser_page_text).to include("Reset the search index and re-populate it.")
    expect(browser_page_text).not_to include("We're sorry, but you are not authorized to view the page you requested. If you think this is an error, please contact us and we'll be happy to help.")
    $browser.find_element(:link_text, "Site Admin").click
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "Rebuild visualization cache").click
    expect($browser.title).to eq("Visualization Tools")
    expect(browser_page_text).to include("Visualization Tools")
    $browser.find_element(:link_text, "Refresh Cached Models for Visualization")
    expect(browser_page_text).to include("Why is it needed?")
    expect(browser_page_text).to include("What's involved in the caching process?")
    expect(browser_page_text).not_to include("We're sorry, but you are not authorized to view the page you requested. If you think this is an error, please contact us and we'll be happy to help.")
    $browser.find_element(:link_text, "Site Admin").click
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "Recompute inferences").click
    expect($browser.title).to eq("VIVO")
    expect($browser.find_element(:name, "submit")["value"]).to eq("Recompute Inferences")
    $browser.find_element(:link_text, "Site Admin").click
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "Restrict logins").click
    expect($browser.title).to eq("Restrict Logins")
    expect(browser_page_text).to include("Restrict Logins")
    expect(browser_page_text).to include("Logins are open to all.")
    $browser.find_element(:link_text, "Restrict Logins")
    expect(browser_page_text).not_to include("We're sorry, but you are not authorized to view the page you requested. If you think this is an error, please contact us and we'll be happy to help.")
    $browser.find_element(:link_text, "Site Admin").click
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "Activate developer panel").click
    browser_wait_for_jQuery
    expect(browser_page_text).to include("VIVO is running in developer mode. (click for Options)")
    expect(browser_page_text).not_to include("We're sorry, but you are not authorized to view the page you requested. If you think this is an error, please contact us and we'll be happy to help.")
    $browser.find_element(:id, "developerPanelClickMe").click
    $browser.find_element(:id, "developer_enabled").click
    $browser.find_element(:id, "developerPanelSaveButton").click
  end

  it "log out" do
    vivo_logout
    $browser.find_element(:link_text, "Home").click
    expect($browser.title).to eq("VIVO")
    end
  end
