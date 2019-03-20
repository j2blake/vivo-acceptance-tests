shared_examples "Create People: Verify Image Display" do
  it "Check image views without logging in" do
    $browser.navigate.to vivo_url("/")
    expect($browser.title).to eq("VIVO")
  end

  it "Navigate to Lily Librarian" do
    $browser.find_element(:link_text, "Index").click
    $browser.find_element(:link_text, "Librarian").click
    expect($browser.title).to eq("Librarian")
    $browser.find_element(:link_text, "Librarian, Lily Lou").click
    expect($browser.title).to eq("Librarian, Lily Lou")
  end

  it "Verify dummy image displays" do
    $browser.find_element(:xpath, ".//img[@title='no image']")
  end

  it "Navigate to Jane Faculty" do
    $browser.find_element(:link_text, "Index").click
    $browser.find_element(:link_text, "Faculty Member").click
    expect($browser.title).to eq("Faculty Member")
    $browser.find_element(:link_text, "Faculty, Jane").click
    expect($browser.title).to eq("Faculty, Jane")
  end

  it "Verify thumbnail displays" do
    $browser.find_element(:xpath, ".//img[@title='click to view larger image']")
    #<tr><td>verifyAttribute</td><td>//img[@title='click to view larger image']@src</td><td>/vivo/file/*/thumbnail_Jane2.jpg</td></tr>
  end

  it "All done" do
    $browser.find_element(:link_text, "Home").click
    expect($browser.title).to eq("VIVO")
    end
  end
