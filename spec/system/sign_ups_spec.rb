require 'rails_helper'

RSpec.describe "ユーザー登録", type: :system do
  scenario "正常なユーザーを登録でき,アカウント承認用メールを送信する" do
    visit root_path
    click_link "新規登録"

    fill_in "お名前", with: "たろう"
    fill_in "メールアドレス", with: "test@example.com"
    fill_in "パスワード", with: "password"
    fill_in "パスワード再確認", with: "password"
    click_button "登録"

    expect(page).to \
      have_content "アカウント承認用のメールを送信しました！確認してください。"
    expect(current_path).to eq root_path

    mail = ActionMailer::Base.deliveries.last

    aggregate_failures do
      expect(mail.to).to eq ["test@example.com"]
      expect(mail.from).to eq ["support@example.com"]
      expect(mail.subject).to eq "アカウント承認"
    end
  end
end