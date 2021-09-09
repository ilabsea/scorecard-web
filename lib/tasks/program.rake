# frozen_string_literal: true

namespace :program do
  desc "migrate short name"
  task migrate_shortcut_name: :environment do
    Program.find_each do |program|
      program.update_column(:shortcut_name, program.name[0..9])
    end
  end

  desc "migrate world vision"
  task migrate_world_vision: :environment do
    wvi = Program.find_or_create_by(name: "Word Vision", shortcut_name: "WVI")

    ProgramService.new(wvi.id).clone_from_sample
    LocalNgoService.new(wvi.id).migrate_self_and_dependency
    UserService.new(wvi.id).migrate_program
  end
end
