class Driver < ActiveRecord::Base
	validates :comment, :address, presence: true
	validates :price, numericality:
	{greater_than_or_equal_to: 0.01}
	validates_numericality_of :number, only_integer: true,
				greater_than_or_equal_to: 1000000000,
				less_than_or_equal_to: 9999999999,
				message: "Enter a valid number"
	validates :comment, :address, :number, uniqueness: true
	validates_format_of :content_type,
						with: /image/,
						message: "must be a picture"
	def uploaded_driver=(driver_field)
		self.name 			= base_part_of(driver_field.original_filename)
		self.content_type   = driver_field.content_type.chomp
		self.data 			= driver_field.read
	end
	def base_part_of(file_name)
		File.basename(file_name).gsub(/[^\w._-]/, '')
	end
end
