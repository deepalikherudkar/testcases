require 'spec_helper'

describe Book do
  pending "add some examples to (or delete) #{__FILE__}"
  describe "specs with build" do
    it "has a valid factory" do
      expect(FactoryGirl.build(:book)).to be_valid
    end

    it "is invalid without title" do
      book = FactoryGirl.build(:book,:title => nil)
      expect(book).to have(1).errors_on(:title)
    end

    it "is valid with book title and author name" do
      book = FactoryGirl.build(:book,:title => "book1",:author_attributes => {:name => "author1"})
      expect(book).to be_valid
    end

    it "is invalid with duplicate title" do |variable|
      book = Book.create(:title => "cmans",:author_attributes => {:name => "shyamla"})
      new_book = FactoryGirl.build(:book,:title => book.title)
      expect(new_book).to have(1).errors_on(:title)
    end
  end

  describe "specs without build" do
    it "is invalid without book title" do
      expect(Book.new(:title => nil)).to have(1).errors_on(:title)
    end

    it "is invalid without author name" do
      b = Book.new(:title => "Book2",:author_attributes => {:name => nil})
      b.save
      expect(b.author).to have(1).errors_on(:name)
    end

    describe "filter title by letter" do
      before (:each) do
        @book1 = Book.create(:title => "cmans",:author_attributes => {:name => "shyamla"})
        @book2 = Book.create(:title => "PHP",:author_attributes => {:name => "shyamla1"})
        @book3 = Book.create(:title => "csharp",:author_attributes => {:name => "shyamla2"})


      end
      context "With matching letter" do
        it "should return sorted array of results for given title" do
          expect(Book.by_title("c")).to eq ["cmans", "csharp"]
        end
      end

      context "With non matching letter" do
        it "should not return if matching letter not present for given title " do
          expect(Book.by_title("q")).to eq []
        end
      end
    end
  end
end
