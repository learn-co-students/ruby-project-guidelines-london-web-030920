class Contract < ActiveRecord::Base
    belongs_to :player
    belongs_to :team


    def self.total_wage_amount
        Contract.all.sum{|contract|contract.wage}
    end


end