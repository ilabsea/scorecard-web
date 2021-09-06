# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_08_27_015150) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "cafs", force: :cascade do |t|
    t.string "name"
    t.string "sex"
    t.string "date_of_birth"
    t.string "tel"
    t.string "address"
    t.integer "local_ngo_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "actived", default: true
    t.string "educational_background_id"
    t.string "scorecard_knowledge_id"
  end

  create_table "chat_groups", force: :cascade do |t|
    t.string "title"
    t.string "chat_id"
    t.boolean "actived", default: true
    t.text "reason"
    t.string "provider"
    t.integer "program_id"
    t.string "chat_type", default: "group"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "chat_groups_notifications", force: :cascade do |t|
    t.integer "chat_group_id"
    t.integer "notification_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.integer "contact_type"
    t.string "value"
    t.integer "program_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "custom_indicators", force: :cascade do |t|
    t.string "name"
    t.string "audio"
    t.string "scorecard_uuid"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "tag_id"
    t.string "uuid"
  end

  create_table "educational_backgrounds", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "facilitators", force: :cascade do |t|
    t.integer "caf_id"
    t.integer "scorecard_uuid"
    t.string "position"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "facilities", force: :cascade do |t|
    t.string "code"
    t.string "name_en"
    t.integer "parent_id"
    t.integer "lft", null: false
    t.integer "rgt", null: false
    t.integer "depth", default: 0, null: false
    t.integer "children_count", default: 0, null: false
    t.integer "program_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "dataset"
    t.boolean "default", default: false
    t.string "name_km"
    t.index ["lft"], name: "index_facilities_on_lft"
    t.index ["parent_id"], name: "index_facilities_on_parent_id"
    t.index ["rgt"], name: "index_facilities_on_rgt"
  end

  create_table "indicators", force: :cascade do |t|
    t.integer "categorizable_id"
    t.string "categorizable_type"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "tag_id"
    t.integer "display_order"
    t.string "image"
  end

  create_table "language_rating_scales", force: :cascade do |t|
    t.integer "rating_scale_id"
    t.integer "language_id"
    t.string "language_code"
    t.string "audio"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "content"
  end

  create_table "languages", force: :cascade do |t|
    t.string "code"
    t.string "name_en"
    t.string "json_file"
    t.integer "program_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name_km"
  end

  create_table "languages_indicators", force: :cascade do |t|
    t.integer "language_id"
    t.string "language_code"
    t.integer "indicator_id"
    t.string "content"
    t.string "audio"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "version", default: 0
  end

  create_table "local_ngos", force: :cascade do |t|
    t.string "name"
    t.string "province_id", limit: 2
    t.string "district_id", limit: 4
    t.string "commune_id", limit: 6
    t.string "village_id", limit: 8
    t.integer "program_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "code"
    t.string "target_province_ids"
    t.string "target_provinces"
  end

  create_table "locations", primary_key: "code", id: :string, force: :cascade do |t|
    t.string "name_en", null: false
    t.string "name_km", null: false
    t.string "kind", null: false
    t.string "parent_id"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "messages", force: :cascade do |t|
    t.text "content"
    t.string "milestone"
    t.integer "program_id"
    t.boolean "actived", default: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "mobile_notifications", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.integer "success_count"
    t.integer "failure_count"
    t.integer "creator_id"
    t.integer "program_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "mobile_tokens", force: :cascade do |t|
    t.string "token"
    t.integer "program_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "notifications", force: :cascade do |t|
    t.string "provider"
    t.text "emails", default: [], array: true
    t.integer "message_id"
    t.integer "program_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "oauth_access_grants", force: :cascade do |t|
    t.bigint "resource_owner_id", null: false
    t.bigint "application_id", null: false
    t.string "token", null: false
    t.integer "expires_in", null: false
    t.text "redirect_uri", null: false
    t.datetime "created_at", null: false
    t.datetime "revoked_at"
    t.string "scopes", default: "", null: false
    t.index ["application_id"], name: "index_oauth_access_grants_on_application_id"
    t.index ["resource_owner_id"], name: "index_oauth_access_grants_on_resource_owner_id"
    t.index ["token"], name: "index_oauth_access_grants_on_token", unique: true
  end

  create_table "oauth_access_tokens", force: :cascade do |t|
    t.bigint "resource_owner_id"
    t.bigint "application_id", null: false
    t.string "token", null: false
    t.string "refresh_token"
    t.integer "expires_in"
    t.datetime "revoked_at"
    t.datetime "created_at", null: false
    t.string "scopes"
    t.string "previous_refresh_token", default: "", null: false
    t.index ["application_id"], name: "index_oauth_access_tokens_on_application_id"
    t.index ["refresh_token"], name: "index_oauth_access_tokens_on_refresh_token", unique: true
    t.index ["resource_owner_id"], name: "index_oauth_access_tokens_on_resource_owner_id"
    t.index ["token"], name: "index_oauth_access_tokens_on_token", unique: true
  end

  create_table "oauth_applications", force: :cascade do |t|
    t.string "name", null: false
    t.string "uid", null: false
    t.string "secret", null: false
    t.text "redirect_uri", null: false
    t.string "scopes", default: "", null: false
    t.boolean "confidential", default: true, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["uid"], name: "index_oauth_applications_on_uid", unique: true
  end

  create_table "participants", primary_key: "uuid", id: :string, force: :cascade do |t|
    t.string "scorecard_uuid"
    t.integer "age"
    t.string "gender"
    t.boolean "disability", default: false
    t.boolean "minority", default: false
    t.boolean "poor_card", default: false
    t.boolean "youth", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "pdf_templates", force: :cascade do |t|
    t.string "name"
    t.text "content"
    t.string "language_code"
    t.integer "program_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "primary_schools", force: :cascade do |t|
    t.string "code"
    t.string "name_en"
    t.string "name_km"
    t.string "commune_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "district_id"
    t.string "province_id"
  end

  create_table "programs", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "datetime_format", default: "DD-MM-YYYY"
    t.boolean "enable_email_notification", default: false
    t.string "shortcut_name"
  end

  create_table "raised_indicators", force: :cascade do |t|
    t.integer "indicatorable_id"
    t.string "indicatorable_type"
    t.string "scorecard_uuid"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "tag_id"
    t.string "participant_uuid"
  end

  create_table "rating_scales", force: :cascade do |t|
    t.string "code"
    t.string "value"
    t.string "name"
    t.integer "program_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "ratings", primary_key: "uuid", id: :string, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string "scorecard_uuid"
    t.integer "score"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "voting_indicator_uuid"
    t.string "participant_uuid"
  end

  create_table "scorecard_knowledges", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "scorecard_progresses", force: :cascade do |t|
    t.string "scorecard_uuid"
    t.integer "status"
    t.string "device_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "scorecard_references", force: :cascade do |t|
    t.string "uuid"
    t.string "scorecard_uuid"
    t.string "attachment"
    t.string "kind"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "scorecards", force: :cascade do |t|
    t.string "uuid"
    t.integer "unit_type_id"
    t.integer "facility_id"
    t.string "name"
    t.text "description"
    t.string "province_id", limit: 2
    t.string "district_id", limit: 4
    t.string "commune_id", limit: 6
    t.integer "year"
    t.datetime "conducted_date"
    t.integer "number_of_caf"
    t.integer "number_of_participant"
    t.integer "number_of_female"
    t.datetime "planned_start_date"
    t.datetime "planned_end_date"
    t.integer "status"
    t.integer "program_id"
    t.integer "local_ngo_id"
    t.integer "scorecard_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "location_code"
    t.integer "number_of_disability"
    t.integer "number_of_ethnic_minority"
    t.integer "number_of_youth"
    t.integer "number_of_id_poor"
    t.integer "creator_id"
    t.datetime "locked_at"
    t.string "primary_school_code"
    t.integer "downloaded_count", default: 0
    t.integer "progress"
    t.string "language_conducted_code"
    t.datetime "finished_date"
    t.datetime "running_date"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_scorecards_on_deleted_at"
    t.index ["uuid"], name: "index_scorecards_on_uuid"
  end

  create_table "suggested_actions", force: :cascade do |t|
    t.string "voting_indicator_uuid"
    t.string "content"
    t.boolean "selected"
    t.string "scorecard_uuid"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.string "color"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "telegram_bots", force: :cascade do |t|
    t.string "token"
    t.string "username"
    t.boolean "enabled", default: false
    t.boolean "actived", default: false
    t.integer "program_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "templates", force: :cascade do |t|
    t.string "name"
    t.integer "program_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: ""
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "role"
    t.integer "program_id"
    t.string "authentication_token", default: ""
    t.datetime "token_expired_date"
    t.string "language_code", default: "en"
    t.string "unlock_token"
    t.datetime "locked_at"
    t.integer "failed_attempts", default: 0
    t.integer "local_ngo_id"
    t.boolean "actived", default: true
    t.index ["authentication_token"], name: "index_users_on_authentication_token", unique: true
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "voting_indicators", primary_key: "uuid", id: :string, default: "uuid_generate_v4()", force: :cascade do |t|
    t.integer "indicatorable_id"
    t.string "indicatorable_type"
    t.string "scorecard_uuid"
    t.integer "median"
    t.text "strength"
    t.text "weakness"
    t.text "suggested_action"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "oauth_access_grants", "oauth_applications", column: "application_id"
  add_foreign_key "oauth_access_grants", "users", column: "resource_owner_id"
  add_foreign_key "oauth_access_tokens", "oauth_applications", column: "application_id"
  add_foreign_key "oauth_access_tokens", "users", column: "resource_owner_id"
end
