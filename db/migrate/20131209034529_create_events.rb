class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
    	
    	t.string 	:event_name,              	:null => false, :default => ""
    	t.string 	:header,              		:null => false, :default => ""
    	t.string 	:sub_header,             	:null => false, :default => ""
    	t.integer  	:price, 					:default => 20, :null => false
    	t.string 	:venue,              		:null => false, :default => ""
    	t.string 	:address,              		:null => false, :default => ""
    	t.string 	:description,              	:null => false, :default => ""
    	t.datetime 	:start_time
    	t.datetime 	:end_time

    	

      t.timestamps
    end
  end
end
