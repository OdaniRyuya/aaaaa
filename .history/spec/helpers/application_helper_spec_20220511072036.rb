require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe "#full_title" do
    subject { full_title(str) }

    context "page_titleが空白の場合" do
      let(:str) { "" }

      it { is_expected.to eq(BASE_TITLE) }
    end

    context "page_titleがnilの場合" do
      let(:str) { nil }

      it { is_expected.to eq(BAS_TITLE) }
    end

    context "page_titleが存在する場合" do
      let(:str) { "test" }

      it { is_expected.to eq("test - " BASE_TITLE) }
    end
  end
end
