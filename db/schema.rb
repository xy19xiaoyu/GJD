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

ActiveRecord::Schema.define(version: 20141006143346) do

  create_table "add_go_down_id_to_sub_orders", force: true do |t|
    t.string   "GoDownId"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "batches", force: true do |t|
    t.string   "Batchid"
    t.string   "Date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: true do |t|
    t.string   "Name"
    t.string   "Type"
    t.integer  "Parentid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "go_downs", force: true do |t|
    t.string   "GoDownId"
    t.string   "Name"
    t.string   "Address"
    t.string   "Admin"
    t.string   "Tel"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "items", force: true do |t|
    t.string   "ItemId"
    t.string   "Name"
    t.integer  "CategoryId"
    t.string   "CategoryName"
    t.integer  "subCategoryid"
    t.string   "subCategoryName"
    t.string   "Type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", force: true do |t|
    t.string   "OrderId"
    t.string   "Name"
    t.string   "Type"
    t.date     "CreateTime"
    t.string   "CreateUser"
    t.date     "ExecTime"
    t.string   "Execer"
    t.string   "State"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sub_categories", force: true do |t|
    t.integer  "CategoryId"
    t.string   "CategoryName"
    t.string   "Name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sub_orders", force: true do |t|
    t.string   "OrderId"
    t.string   "ItemNo"
    t.string   "CreateTime"
    t.integer  "ShelfLife"
    t.integer  "Sum"
    t.integer  "Sum1"
    t.string   "BatchId"
    t.string   "MadeIn"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "GoDownId"
  end

end
