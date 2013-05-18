require 'spec_helper'

describe AuthorsController do |variable|

  def valid_record
    FactoryGirl.build(:author)
  end

    def invalid_record
    FactoryGirl.build(:author,:name => nil)
  end

  def create_valid_author
    FactoryGirl.create(:author)
  end

  def valid_session
    {}
  end

  describe "GET show" do
    it "assigns the requested author as @author" do
      author = create_valid_author
      get :show,{:id => author.to_param}, valid_session
      assigns(:author).should eq author
    end
  end

  describe "GET new" do |variable|
    it "assigns a new author as @author" do |variable|
      get :new, {}, valid_session
      assigns(:author).should be_a_new(Author)
    end
  end

  describe "GET create" do |variable|
    context "with valid parameters" do
      it "assigns a new author as @author" do
        expect {
          post :create, {:author => valid_record.attributes}, valid_session
        }.should change(Author, :count).by(1)
      end

      it "assigns a new author as @author" do |variable|
        post :create, {:author => valid_record.attributes}
        assigns(:author).should be_a(Author)
        assigns(:author).should be_persisted
      end
    end

    context "with invalid parameters" do
      it "should render new template" do
        post :create,{:author => invalid_record}, valid_session
        response.should render_template("new")
      end
    end
  end
end