require 'spec_helper'
include Devise::TestHelpers

describe AuthorsController do
  def valid_record
    FactoryGirl.build(:author)
  end

    def invalid_record
    FactoryGirl.build(:author,:name => nil)
  end

  def create_valid_author
    FactoryGirl.create(:author)
  end

  def create_invalid_author
    FactoryGirl.build(:author,:name => nil)
  end

  def valid_session
    {}
  end

  describe "signed-in user" do
    before(:each) do
      @request.env["devise.mapping"] = :user
      @user = FactoryGirl.create(:user)
      @user.confirm!
      sign_in @user
      @user.stub(:user_signed_in?) { true }
    end

    describe "GET index " do
      it "should get list of records" do
        author = create_valid_author
        get :index
        expect(assigns(:authors)).to match_array [author]
      end

      it "should render template" do
        expect(get :index).should render_template("index")
      end
    end
    describe "GET show" do
      it "assigns the requested author as @author" do
        author = create_valid_author
        get :show,{:id => author.to_param}
        assigns(:author).should eq author
      end
    end

    describe "GET new" do
      it "assigns a new author as @author" do
        get :new, {}
        assigns(:author).should be_a_new(Author)
      end
    end

    describe "POST create" do
      context "with valid parameters" do
        it "assigns a new author as @author" do
          expect {
            post :create, {:author => valid_record.attributes}
          }.should change(Author, :count).by(1)
        end

        it "assigns phone list to new author" do
        phones = [ attributes_for(:phone, phone_type: "home"),
                  attributes_for(:phone, phone_type: "office"),
                  attributes_for(:phone, phone_type: "mobile")
          ]
          attributes = valid_record.attributes.merge(:phones_attributes => phones)
          post :create, {:author => attributes }
          assigns[:author].should be_a(Author)
          assigns[:author].phones.count.should eq 3
        end

        it "assigns a new author as @author" do
          post :create, {:author => valid_record.attributes}
          assigns(:author).should be_a(Author)
          assigns(:author).should be_persisted
      end
      end

      context "with invalid parameters" do
        it "should render new template" do
          post :create,{:author => create_invalid_author}
          response.should render_template("new")
        end

        it "should not create new author" do
          author = create_invalid_author
          post :create,{:author => author}
          response.should render_template("new")
        end
      end
    end

    describe "DELETE destroy" do
      it "should delete the given record" do
        author = create_valid_author
          expect {
            delete :destroy,:id => author
          }.should change(Author, :count).by(-1)
      end

      it "should redirect to authors page" do
        author = create_valid_author
        delete :destroy,:id => author
        expect(response).should redirect_to authors_url
      end
    end
  end
end