class AddAvailableForHireDefaultValueToUsers < ActiveRecord::Migration
    def up
      # These users likely abandonned profile setup so just set them to not available for hire
      change_column_default :users, :available_for_hire, false
      User.where("available_for_hire IS NULL").each{|user|
        user.update(available_for_hire: false)
      }
    end

    def down
      change_column_default :users, :available_for_hire, nil
    end
end
