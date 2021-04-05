# frozen_string_literal: true

module Templates
  class PdfTemplateField
    def self.all
      [
        { name: "province", code: "scorecard.province" },
        { name: "district", code: "scorecard.district" },
        { name: "commune", code: "scorecard.commune" },
        { name: "result_table", code: "swot.result_table" },
        { name: "facility", code: "scorecard.facility_name" },
        { name: "conducted_date", code: "scorecard.conducted_date" },
      ]
    end
  end
end
