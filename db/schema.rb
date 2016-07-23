# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160723151859) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "analyst_infos", force: :cascade do |t|
    t.integer  "analyst_id"
    t.string   "name"
    t.string   "username"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "applicant_infos", force: :cascade do |t|
    t.integer  "applicant_id"
    t.string   "name"
    t.string   "username"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "computers", force: :cascade do |t|
    t.string   "marca"
    t.string   "modelo"
    t.string   "serial"
    t.string   "bien_nacional"
    t.string   "tarjeta_madre"
    t.string   "procesador"
    t.string   "memoria_ram"
    t.string   "disco_duro"
    t.string   "cdrom"
    t.string   "sistema_operativo"
    t.boolean  "en_red",            default: false
    t.text     "software_extra"
    t.integer  "estatus_servicio",  default: 0
    t.integer  "tipo",              default: 0
    t.boolean  "estatus",           default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "keyboards", force: :cascade do |t|
    t.integer  "computer_id"
    t.string   "marca"
    t.string   "modelo"
    t.string   "serial"
    t.string   "bien_nacional"
    t.boolean  "estatus",       default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "manager_infos", force: :cascade do |t|
    t.integer  "manager_id"
    t.string   "name"
    t.string   "username"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mice", force: :cascade do |t|
    t.integer  "computer_id"
    t.string   "marca"
    t.string   "modelo"
    t.string   "serial"
    t.string   "bien_nacional"
    t.boolean  "estatus",       default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "regulators", force: :cascade do |t|
    t.integer  "computer_id"
    t.string   "marca"
    t.string   "modelo"
    t.string   "serial"
    t.string   "bien_nacional"
    t.boolean  "estatus",       default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "screens", force: :cascade do |t|
    t.integer  "computer_id"
    t.string   "marca"
    t.string   "modelo"
    t.string   "serial"
    t.string   "bien_nacional"
    t.string   "pulgadas"
    t.boolean  "estatus",       default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "solicituds", force: :cascade do |t|
    t.integer  "applicant_id"
    t.integer  "analyst_id"
    t.text     "description"
    t.integer  "estado",       default: 0
    t.boolean  "estatus",      default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",   null: false
    t.string   "encrypted_password",     default: "",   null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,    null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.string   "type"
    t.boolean  "active",                 default: true
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
