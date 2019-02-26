require_relative '../configuration'
require_relative '_create_faculty_member'
require_relative '_create_librarian'

describe "Create People" do
  describe "Create a Faculty Member" do
    include_examples "Create a Faculty Member"
  end

  describe "Create a Librarian" do
    include_examples "Create a Librarian"
  end

end
