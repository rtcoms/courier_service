class AddUserReferencesTocouriierRequests < ActiveRecord::Migration[6.1]
  def change
    add_reference :courier_requests, :user, index: true, null: false
  end
end
