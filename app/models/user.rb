class User < ActiveRecord::Base
    belongs_to :referrer, :class_name => "User", :foreign_key => "referrer_id"
    has_many :referrals, :class_name => "User", :foreign_key => "referrer_id"
    
    attr_accessible :email

    validates :email, :uniqueness => true, :format => { :with => /\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/i, :message => "Invalid email format." }
    validates :referral_code, :uniqueness => true

    before_create :create_referral_code
    after_create :send_welcome_email

    REFERRAL_STEPS = [
        {
            'count' => 2,
            "html" => "The Habit<br>Change eBook",
            "class" => "two",
            "image" =>  ActionController::Base.helpers.asset_path("pavlok/1-ebook.png")
        },
        {
            'count' => 5,
            "html" => "One Pre-Paid<br>Shock Credit",
            "class" => "three",
            "image" => ActionController::Base.helpers.asset_path("pavlok/2-shock-credit.png")
        },
        {
            'count' => 15,
            "html" => "One Pavlok Shocking<br>Business Card",
            "class" => "four",
            "image" => ActionController::Base.helpers.asset_path("pavlok/3-shocking-business-card.png")
        },
        {
            'count' => 40,
            "html" => "One Pavlok Wristband<br>Of Your Very Own",
            "class" => "five",
            "image" => ActionController::Base.helpers.asset_path("pavlok/4-pavlok.png")
        } 
    ]

    private

    def create_referral_code
        referral_code = SecureRandom.hex(5)
        @collision = User.find_by_referral_code(referral_code)

        while !@collision.nil?
            referral_code = SecureRandom.hex(5)
            @collision = User.find_by_referral_code(referral_code)
        end

        self.referral_code = referral_code
    end

    def send_welcome_email
        UserMailer.delay.signup_email(self)
    end
end
