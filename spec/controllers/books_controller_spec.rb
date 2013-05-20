require 'spec_helper'

describe BooksController do
  def valid_attributes
    { "title" => "MyString1",:author_attributes => {:name => "author"} }
  end

  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all books as @books" do
      book = Book.create! valid_attributes
      get :index, {}, valid_session
      assigns(:books).should eq([book])
    end
  end

  describe "GET show" do
    it "assigns the requested book as @book" do
      book = Book.create! valid_attributes
      get :show, {:id => book.to_param}, valid_session
      assigns(:book).should eq(book)
    end
  end

  describe "GET new" do
    it "assigns a new book as @book" do
      get :new, {}, valid_session
      assigns(:book).should be_a_new(Book)
    end
  end

  describe "GET edit" do
    it "assigns the requested book as @book" do
      book = Book.create! valid_attributes
      get :edit, {:id => book.to_param}, valid_session
      assigns(:book).should eq(book)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Book" do
        expect {
          post :create, {:book => valid_attributes}, valid_session
        }.to change(Book, :count).by(1)
      end

      it "assigns a newly created book as @book" do
        post :create, {:book => valid_attributes}, valid_session
        assigns(:book).should be_a(Book)
        assigns(:book).should be_persisted
      end

      it "redirects to the created book" do
        post :create, {:book => valid_attributes}, valid_session
        response.should redirect_to(Book.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved book as @book" do
        # Trigger the behavior that occurs when invalid params are submitted
        Book.any_instance.stub(:save).and_return(false)
        post :create, {:book => { "title" => "invalid value" }}, valid_session
        assigns(:book).should be_a_new(Book)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Book.any_instance.stub(:save).and_return(false)
        post :create, {:book => { "title" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested book" do
        book = Book.create! valid_attributes

        Book.any_instance.should_receive(:update_attributes).with({ "title" => "MyString" })
        put :update, {:id => book.to_param, :book => { "title" => "MyString" }}, valid_session
      end

      it "assigns the requested book as @book" do
        book = Book.create! valid_attributes
        put :update, {:id => book.to_param, :book => valid_attributes}, valid_session
        assigns(:book).should eq(book)
      end

      it "redirects to the book" do
        book = Book.create! valid_attributes
        put :update, {:id => book.to_param, :book => {:title => "sample book"}}, valid_session
        response.should redirect_to(book)
      end
    end

    describe "with invalid params" do
      it "assigns the book as @book" do
        book = Book.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Book.any_instance.stub(:save).and_return(false)
        put :update, {:id => book.to_param, :book => { "title" => "invalid value" }}, valid_session
        assigns(:book).should eq(book)
      end

      it "re-renders the 'edit' template" do
        book = Book.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Book.any_instance.stub(:save).and_return(false)
        put :update, {:id => book.to_param, :book => { "title" => "invalid value",:author_attributes => {:name => "author1"}}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested book" do
      book = Book.create! valid_attributes
      expect {
        delete :destroy, {:id => book.to_param}, valid_session
      }.to change(Book, :count).by(-1)
    end

    it "redirects to the books list" do
      book = Book.create! valid_attributes
      delete :destroy, {:id => book.to_param}, valid_session
      response.should redirect_to(books_url)
    end
  end

  describe "publish" do
    it "should reredirect to authors page" do
      book = FactoryGirl.create(:book)
      post :publish_flag,{:book_id => book.to_param }
      book.reload
      expect(book.published?).should eq true
    end

    it "should redirect to authors page" do
      book = FactoryGirl.create(:book)
      post :publish_flag,{:book_id => book.to_param }
      response.should redirect_to books_url
    end
  end
end
