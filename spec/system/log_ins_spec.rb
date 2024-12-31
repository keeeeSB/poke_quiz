require 'rails_helper'

RSpec.describe "ログイン機能", type: :system do
  let(:user) { FactoryBot.create(:user) }

  scenario "ユーザーが正しい情報でログインに成功する" do
    visit root_path
    click_link "ログイン"
    
    fill_in "メールアドレス", with: user.email
    fill_in "パスワード", with: user.password
    click_button "ログイン"

    expect(page).to have_content "ログインしました！"
    expect(current_path).to eq user_path(user)
  end

  scenario "ユーザーが不正な情報でログインに失敗する" do
    visit root_path
    click_link "ログイン"

    fill_in "メールアドレス", with: "wrong@example.com"
    fill_in "パスワード", with: "wrongpassword"
    click_button "ログイン"

    expect(page).to \
      have_content "メールアドレス、又はパスワードが間違っています。"
    expect(current_path).to eq login_path
  end

  scenario "アカウント承認がされていないユーザーはログインに失敗する" do
    user.update(activated: false)

    visit root_path
    click_link "ログイン"

    fill_in "メールアドレス", with: user.email
    fill_in "パスワード", with: user.password
    click_button "ログイン"

    expect(page).to \
      have_content "アカウントが承認されていません。メールを確認してください。"
    expect(current_path).to eq root_path
  end
end
