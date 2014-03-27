require 'spec_helper'
require './lib/translation_checker'

describe TranslationChecker do
  subject do
    TranslationChecker.new("./yaml/translations_false.yml")
  end
  
  describe "#output_missing_translations" do
    before do
      subject.missing_translations = ["header"]
    end

    it "outputs what needs to be translated" do
      subject.should_receive(:puts).and_return("The following needs to be translated:- header")
      subject.output_missing_translations
    end
  end

  describe "check_for_missing_values" do
    it "returns missing values" do
      subject.check_for_missing_values
      subject.missing_translations.should eq ["password_too_short", "email_required", "header", "tagline", "gort", "hadaly", "gir", "card_declined", "card_invalid", "address_required", "success"]
    end
  end
end