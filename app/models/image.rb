class Image < ActiveRecord::Base
	has_attached_file :avatar, 
	styles: { medium: "300x300>", thumb: "100x100>" }, 
	default_url: "/images/:style/missing.png",
	:storage => :s3,
    :s3_credentials => Proc.new{|a| a.instance.s3_credentials }

  	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  	
  	def s3_credentials
    	{:bucket => 'kevins-bucket1994', 
    	:access_key_id => Rails.application.secrets.s3_client_id,
    	:secret_access_key => Rails.application.secrets.s3_client_secret}
  	end
end
