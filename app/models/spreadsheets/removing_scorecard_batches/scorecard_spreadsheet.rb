# frozen_string_literal: true

module Spreadsheets
  module RemovingScorecardBatches
    class ScorecardSpreadsheet
      attr_reader :program, :row

      def initialize(program, row)
        @program = program
        @row = row
      end

      def process
        OpenStruct.new(
          code: scorecard_code,
          local_ngo: local_ngo_name,
          scorecard_type: scorecard_type_name,
          status: removing_scorecard.try(:status),
          valid?: removing_scorecard.present?,
          invalid_reason: (removing_scorecard.present? ? "" : invalid_message),
          planned_start_date: removing_scorecard.try(:planned_start_date),
          facility: removing_scorecard.try(:facility_name)
        )
      end

      private
        def invalid_message
          I18n.t("scorecard_batch.mismatch_code_or_type_or_lngo")
        end

        def removing_scorecard
          @removing_scorecard ||= program.scorecards.find_by(uuid: scorecard_code, local_ngo_id: local_ngo.try(:id), scorecard_type: scorecard_type.try(:code))
        end

        def scorecard_code
          @scorecard_code ||= parse_string(row["code"])
        end

        def scorecard_type
          @scorecard_type ||= program.program_scorecard_types.find_by(code: parse_string(row["scorecard_type_en"]))
        rescue
          nil
        end

        def scorecard_type_name
          @scorecard_type_name ||= scorecard_type.try(:name) || parse_string(row["scorecard_type_en"])
        end

        def local_ngo
          @local_ngo ||= program.local_ngos.find_by(code: parse_string(row["local_ngo_code"]))
        end

        def local_ngo_name
          @local_ngo_name ||= local_ngo.try(:name) || parse_string(row["local_ngo_code"])
        end

        def parse_string(data)
          data.to_s.strip
        end
    end
  end
end
