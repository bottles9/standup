require 'rails_helper'

RSpec.describe UsersController, type: :controller do
    login_user

    describe "Get #index" do
        it "returns http success" do
            get :index
            expect(response).to have_http_status(:success)
        end

        it "renders :index" do
            get :index
            expect(response).to render_template :index
        end

        it "lists users" do
            get :index
            expect(assigns(:users).length).to equal(1)
        end
    end

    describe "Get #me" do
        it "returns http sucess" do
            get :me
            expect(response).to have_http_status(:success)
        end
    end

    describe "Put #update_me" do
        user = FactoryBot.create(:user)
        it "returns http success" do
            put :update_me, params: {id: user.id, user: {name: 'John'}}
        end

        it "renders :me of failure" do
            put :update_me, params: {
            id: :user,
            user: {name: 'John', email: nil}
            }
            expect(response).to render_template :me
        end
    end

    describe "Get #password" do
        it "returns http sucess" do
            get :password
            expect(response).to have_http_status(:success)
        end
    end

    describe "PUT #update_password" do
        user = FactoryBot.create(:user)
        it "returns http success" do
            put :update_password, params: {
            id: :user,
            user: {password: 'd2g4j6mlp', password_confirmation: 'd2g4j6mlp'}
            }
            expect(response).to redirect_to my_password_path
        end

        it "renders :password of failure" do
            put :update_password, params: {id: user.id, user: {
            password: '123',
            password_confirmation: '123'
            }}
            expect(response).to render_template :password
        end
    end

    describe "GET #new" do
        it "returns http success" do
            get :new
            expect(response).to have_http_status(:success)
       end

        it "renders new template" do
            get :new
            expect(response).to render_template :new
        end
    end

    describe "POST #create" do
        it "creates a user" do
            post :create, params: {
            user: FactoryBot.attributes_for(:user, {role: 'user'})
            }
            expect(response).to redirect_to account_users_path
        end

        it "renders :new on failure" do
            post :create, params: {
            user: FactoryBot.attributes_for(:user,{email: nil, role: 'user'})
            }
            expect(response).to render_template :new
        end

        it "fails on non-unique email" do
            user = FactoryBot.create(:user)
            post :create, params: {
            user: FactoryBot.attributes_for(:user,{
            email: user.email,
            role: 'user'
            }
            )}
            expect(response).to render_template :new
        end
    end

    describe "GET #edit" do
        user = FactoryBot.create(:user)
        it "returns http success" do
            get :edit, params: {id: user.id}
            expect(response).to have_http_status(:success)
        end

        it "renders :edit" do
            get :edit, params: {id: user.id}
            expect(response).to render_template :edit
        end
    end

    describe "PUT #update" do
        user = FactoryBot.create(:user)
        it "returns http success" do
            put :update, params: {id: user.id, user: {name: "Yay"}}
            expect(response).to redirect_to account_users_path
        end
        it "renders :edit on failure" do
            put :update, params: {
            id: user.id,
            user:FactoryBot.attributes_for(:user,{email: nil, role: 'user'})
            }
            expect(response).to render_template :edit
        end
    end

    describe "DELETE #destroy" do
        user = FactoryBot.create(:user)
        it "returns http success" do
            delete :destroy, params: {id: user.id}
            expect(response).to redirect_to account_users_path
        end
    end
end