class CreateMetricVariables < ActiveRecord::Migration
  def change
    create_table :metric_variables do |t|
      t.string  :name
      t.string  :metric_abr
      t.integer :sample_rate, default: 1
      t.timestamps
    end
  end
end
