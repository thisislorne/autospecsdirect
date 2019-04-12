class AddTimestamps < ActiveRecord::Migration[5.2]
  def change
    add_timestamps :searches, default: Time.zone.now
    change_column_default :searches, :created_at, nil
    change_column_default :searches, :updated_at, nil

    add_timestamps :queries, default: Time.zone.now
    change_column_default :queries, :created_at, nil
    change_column_default :queries, :updated_at, nil

    add_timestamps :optimised_queries, default: Time.zone.now
    change_column_default :optimised_queries, :created_at, nil
    change_column_default :optimised_queries, :updated_at, nil
  end
end

