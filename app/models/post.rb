
class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
    validate :non_clickbait
    BAITS = ["Won't Believe", "Secret", "Top [number]", "Guess"]
    def non_clickbait        
        if  title && BAITS.none? { |bait| title.include?(bait)}
            errors.add( :title, "Not clickbait-y")
        end
    end
end
