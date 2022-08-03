require 'rails_helper'

::RSpect.describe do
  desc "total amount test"
  before do
    let(:organisation_additional_user) { FactoryBot.create(:organisation) }
    7.times {  FactoryBot.create(:user, organistaion: organisation_additional_user) }

    let(:organisation) { FactoryBot.create(:organisation) }
    2.times { let(:user) { FactoryBot.create(:user, organistaion: organisation) } }

    let(:annual_plan) { FactoryBot.create(:plan, interval: 'annual', interval_count: 1) }
    let(:annual_subscription) { FactoryBot.create(:subscription, user: user, organisation: organisation, plan: monthly_plan) }
    let(:annual_invoice) { FactoryBot.create(:invoice, subscription: annual_subscription,
                                             user: user, organisation: organisation) }

    let(:monthly_plan) { FactoryBot.create(:plan, interval: 'monthly', interval_count: 1) }
    let(:month_subscription) { FactoryBot.create(:subscription, user: user, organisation: organisation, plan: monthly_plan) }
    let(:month_invoice) { FactoryBot.create(:invoice, subscription: month_subscription,
                                             user: user, organisation: organisation) }

  end

  desc "This Test is trying to test functionality in success cases and not consider exceptions"

  context "check for total amount accurancy" do
    it "organisation startup with monthly plan" do
      total_amount = ::Invoice::TotalAmount.call(organisation: organisation, title: monthly_plan.title).amount
      expect(total_amount).to eq(20)
    end

    it "organisation startup with annual plan" do
      total_amount = ::Invoice::TotalAmount.call(organisation: organisation, title: annual_plan.title).amount
      expect(total_amount).to eq(216)
    end

    it "organisation startup with monthly plan and additional user" do
      total_amount = ::Invoice::TotalAmount.call(organisation: organisation_additional_user, title: monthly_plan.title).amount
      expect(total_amount).to eq(27)
    end

  end
end