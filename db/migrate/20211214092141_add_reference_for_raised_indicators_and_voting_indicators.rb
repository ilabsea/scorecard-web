class AddReferenceForRaisedIndicatorsAndVotingIndicators < ActiveRecord::Migration[6.1]
  def up
    add_column :raised_indicators, :uuid, :uuid, default: "gen_random_uuid()", null: false
    rename_column :raised_indicators, :id, :integer_id
    rename_column :raised_indicators, :uuid, :id
    execute "ALTER TABLE raised_indicators drop constraint raised_indicators_pkey;"
    execute "ALTER TABLE raised_indicators ADD PRIMARY KEY (id);"

    add_column :raised_indicators, :selected, :boolean, default: false
    add_column :voting_indicators, :raised_indicator_id, :string

    Rake::Task["voting_indicator:migrate_reference_with_raised_indicator"].invoke
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
