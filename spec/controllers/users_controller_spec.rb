require 'rails_helper'

RSpec.describe UsersController do 
  describe "#index" do
=begin
  1. Hit the endpoint, we expect that to return 200
  2. We expect to render the INDEX page (HTML returned)
  3. [OPTIONAL] we expect the instance variable @users to be assigned to User.all
=end
    it "should return 200" do
      get :index
      expect(response.status).to eq(200)
    end

    it "should render INDEX page" do
      get :index
      expect(response).to render_template("index") 
      # name of the html.erb file
    end

  end
  describe "#new" do
    it "should return 200" do 
      get :new
      expect(response.status).to eq(200)
    end

    it "should render NEW page" do
      get :new
      expect(response).to render_template("new") 
    end
  end

  describe "#create" do
=begin
  1. Make a post request to the create page
  2. We expect a user to be created
  3. We expect status 302
  4. We expect to be redirected to the user's page
=end
    context "with valid params" do
      it "creates a new user" do
        # post request to create endpoint with params
        # will create a user in the test DB - gets deleted after test is run
        params = {user: {name: "Bob", age: 30}}
        expect {post(:create, params: params)}.to change {User.count}.from(0).to(1)
      end
  
      it 'redirects the user' do
        params = {user: {name: "Bob", age: 30}}
        post(:create, params: params)
        user = User.last
        expect(response.status).to eq (302)
        # my result -> answer
        expect(response).to redirect_to(user_url(user))
        # user_url matches with User
      end
    end

    context "with invalid params" do 
      let(:invalid_params) {{user: {invalid: "invalid"}}}
      it "should not change User count" do
        # make sure no users to be created
        expect {post(:create, params: invalid_params)}.to_not change {User.count}
        # expect(response.status).to eq(302)
        # expect(response).to redirect_to(user_url(user))
      end
    end 

  end

  describe "#edit" do
=begin
  1. Hit the endpoint, we expect that to return 200
  2. We expect to render the EDIT page (HTML returned)
  3. [OPTIONAL] we expect the instance variable @users to be assigned to User.all
=end
    it "should return 200" do 
      # create user
      user = User.create({name: "Bob"})
      get :edit, params: {id: user.id}
      expect(response.status).to eq(200)
    end

    it "should render the EDIT page for the user" do
      user = User.create({name: "Bob"})
      get :edit, params: {id:user.id}
      expect(response).to render_template("edit")
    end
  end

  describe "#update" do
=begin
  For valid params
  1. Hit the endpoint, we expect that to return 302
  2. We expect it to update user
  3. We expect to be redirected to user's page

  For invalid params
  1. It does not update the user
=end

    context "with valid params" do
      it "should return 302" do
        user = User.create({name: "Old", age: 18})
        # pass user id and object containing the update
        put :update, params: {id: user.id, user: {name: "New"}}
        expect(response.status).to eq(302)
      end

      it "updates the requested user" do
        user = User.create({name: "Old", age: 18})
        put :update, params: {id: user.id, user: {name: "New", age: 28}}
        user.reload
        expect(user.name).to eq("New")
        expect(user.age).to eq(28)
      end
  
      it "redirects the user to the user page" do
        user = User.create({name: "Old", age: 18})
        put :update, params: {id: user.id, user: {name: "New"}}
        expect(response).to redirect_to(user_url(user))
      end
    end

    context "with invalid params" do
      it "does not update the user" do
        user = User.create({name: "Old", age: 18})
        put :update, params: {id: user.id, user: {name: ""}}
        user.reload
        expect(user.name).to eq("Old")
      end
    end
  end

  describe "#destroy" do
=begin
    1. Should reduce user count
    2. Redirect to users index '/'
=end
      it "should reduce user count" do
        user = User.create({name: "Bob", age: 18})
        expect { 
          delete(:destroy, params: {id: user.to_param}) 
        }.to change {User.count}.from(1).to(0)
      end

      it "should redirect user to users index/ homepage" do
        user = User.create({name: "Bob", age: 18})
        delete :destroy, params: {id: user.id}
        expect(response).to redirect_to("/")
      end
    end

end