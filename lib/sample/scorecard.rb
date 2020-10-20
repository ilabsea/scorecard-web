# frozen_string_literal: true

module Sample
  class Scorecard
    def self.load
      1.times do |i|
        build_scorecard
      end
    end

    private
      def self.build_scorecard
        number_of_caf = rand(1..5)
        number_of_participant = rand(5..15)
        number_of_female = rand(1...number_of_participant)
        conducted_date = Date.today
        commune = ::Pumi::Commune.all.sample
        category = ::Category.where.not(parent_id: nil).sample
        local_ngo = ::LocalNgo.all.sample

        ::Scorecard.create({
          name: "Scorecard #{category.name}",
          conducted_date: conducted_date,
          province_id: commune.province_id,
          district_id: commune.district_id,
          commune_id: commune.id,
          category_id: category.id,
          unit_type_id: category.parent_id,
          number_of_caf: number_of_caf,
          number_of_participant: number_of_participant,
          number_of_female: number_of_female,
          local_ngo_id: local_ngo.id,
          program_id: local_ngo.program_id,
          scorecard_type_id: local_ngo.program.scorecard_types.sample.id
        })
      end
  end
end
