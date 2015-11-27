class Listing < ActiveRecord::Base
  if Rails.env.development?
  	 	has_attached_file :image, :styles => { :medium => "200x", :thumb => "100x100>" }, :default_url => "noimage.jpg"
  else
 		has_attached_file :image, :styles => { :medium => "200x", :thumb => "100x100>" }, :default_url => "noimage.jpg",
    					  :storage => :s3,
      					  :s3_credentials => {
      					  	:bucket => ENV['ETSYDEMO-JUSTINOBERG'],
   							:access_key_id => ENV['AKIAJSU7F2E56KJB3S6A'],
    						:secret_access_key => ENV['FCN6uInYlWbgehzjpHnGATbfKH6XDfqX6q6kLr']
      					  }
      					  :path => ":style/:id_:filename"
  end

	  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
