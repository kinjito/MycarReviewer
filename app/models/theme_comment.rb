class ThemeComment < ApplicationRecord
  
    belongs_to :theme
    belongs_to :user
    
    def written_by?(current_user)
      user.id == current_user.id 
    end
  
end
