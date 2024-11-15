# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 20_241_106_114_646) do
  create_table 'diagnoses', charset: 'utf8mb4', collation: 'utf8mb4_0900_ai_ci', force: :cascade do |t|
    t.string 'title'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'favorites', charset: 'utf8mb4', collation: 'utf8mb4_0900_ai_ci', force: :cascade do |t|
    t.bigint 'user_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'video_id'
    t.integer 'result_id'
    t.index ['user_id'], name: 'index_favorites_on_user_id'
  end

  create_table 'okotos', charset: 'utf8mb4', collation: 'utf8mb4_0900_ai_ci', force: :cascade do |t|
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'results', charset: 'utf8mb4', collation: 'utf8mb4_0900_ai_ci', force: :cascade do |t|
    t.string 'title'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.bigint 'diagnosis_id', null: false
    t.index ['diagnosis_id'], name: 'index_results_on_diagnosis_id'
  end

  create_table 'users', charset: 'utf8mb4', collation: 'utf8mb4_0900_ai_ci', force: :cascade do |t|
    t.string 'line_user_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'name'
    t.index ['line_user_id'], name: 'index_users_on_line_user_id', unique: true
  end

  create_table 'videos', charset: 'utf8mb4', collation: 'utf8mb4_0900_ai_ci', force: :cascade do |t|
    t.string 'title'
    t.text 'embed_code'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'youtube_video_id'
    t.integer 'video_id'
    t.string 'result_id'
    t.bigint 'user_id'
  end

  create_table 'youtube_videos', charset: 'utf8mb4', collation: 'utf8mb4_0900_ai_ci', force: :cascade do |t|
    t.string 'youtube_id'
    t.string 'title'
    t.text 'description'
    t.datetime 'published_at'
    t.integer 'duration'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.bigint 'result_id', null: false
    t.integer 'video_id'
    t.index ['result_id'], name: 'index_youtube_videos_on_result_id'
  end

  add_foreign_key 'favorites', 'users'
  add_foreign_key 'results', 'diagnoses'
  add_foreign_key 'youtube_videos', 'results'
end
