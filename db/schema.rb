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

ActiveRecord::Schema.define(version: 2020_03_15_105302) do

  create_table "assigns", force: :cascade do |t|
    t.datetime "date"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "exam_id"
    t.index ["exam_id"], name: "index_assigns_on_exam_id"
    t.index ["user_id", "exam_id"], name: "index_assigns_on_user_id_and_exam_id", unique: true
    t.index ["user_id"], name: "index_assigns_on_user_id"
  end

  create_table "branches", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "exams", force: :cascade do |t|
    t.string "name"
    t.string "info"
    t.integer "duration"
    t.integer "passing_marks"
    t.string "etype"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "subject_id"
    t.datetime "start_date"
    t.datetime "end_date"
    t.index ["subject_id"], name: "index_exams_on_subject_id"
    t.index ["user_id"], name: "index_exams_on_user_id"
  end

  create_table "optionfields", force: :cascade do |t|
    t.string "name"
    t.string "field_type"
    t.boolean "required"
    t.integer "question_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["question_id"], name: "index_optionfields_on_question_id"
  end

  create_table "options", force: :cascade do |t|
    t.string "name"
    t.integer "question_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "answer", default: false
    t.string "option_index"
    t.index ["question_id"], name: "index_options_on_question_id"
  end

  create_table "questions", force: :cascade do |t|
    t.integer "sem"
    t.string "info"
    t.string "answer"
    t.integer "exam_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["exam_id"], name: "index_questions_on_exam_id"
  end

  create_table "results", force: :cascade do |t|
    t.integer "score"
    t.integer "user_id"
    t.integer "exam_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["exam_id"], name: "index_results_on_exam_id"
    t.index ["user_id", "exam_id"], name: "index_results_on_user_id_and_exam_id", unique: true
    t.index ["user_id"], name: "index_results_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.integer "resource_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["name"], name: "index_roles_on_name"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource_type_and_resource_id"
  end

  create_table "semesters", force: :cascade do |t|
    t.integer "sem"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "subjects", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "semester_id"
    t.integer "branch_id"
    t.index ["branch_id"], name: "index_subjects_on_branch_id"
    t.index ["semester_id"], name: "index_subjects_on_semester_id"
  end

  create_table "user_answers", force: :cascade do |t|
    t.integer "user_id"
    t.integer "exam_id"
    t.integer "option_id"
    t.integer "question_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["exam_id"], name: "index_user_answers_on_exam_id"
    t.index ["option_id"], name: "index_user_answers_on_option_id"
    t.index ["question_id"], name: "index_user_answers_on_question_id"
    t.index ["user_id"], name: "index_user_answers_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: ""
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "enrollment"
    t.string "fname"
    t.string "lname"
    t.integer "mobile"
    t.integer "pass_out_year"
    t.integer "status"
    t.integer "branch_id"
    t.integer "semester_id"
    t.index ["branch_id"], name: "index_users_on_branch_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["semester_id"], name: "index_users_on_semester_id"
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  add_foreign_key "assigns", "exams"
  add_foreign_key "assigns", "users"
  add_foreign_key "exams", "subjects"
  add_foreign_key "exams", "users"
  add_foreign_key "optionfields", "questions"
  add_foreign_key "options", "questions"
  add_foreign_key "questions", "exams"
  add_foreign_key "results", "exams"
  add_foreign_key "results", "users"
  add_foreign_key "subjects", "branches"
  add_foreign_key "subjects", "semesters"
  add_foreign_key "user_answers", "exams"
  add_foreign_key "user_answers", "options"
  add_foreign_key "user_answers", "questions"
  add_foreign_key "user_answers", "users"
  add_foreign_key "users", "branches"
  add_foreign_key "users", "semesters"
end
