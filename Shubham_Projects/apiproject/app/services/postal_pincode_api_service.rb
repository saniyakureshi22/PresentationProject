class PostalPincodeApiService
    include HTTParty
    base_uri 'https://api.postalpincode.in'
  
    def self.get_post_office_by_pincode(pincode)
      response = get("/pincode/#{pincode}")
      parse_response(response)
    end
  
    def self.get_post_office_by_branch_name(branch_name)
      response = get("/postoffice/#{branch_name}")
      parse_response(response)
    end
  
    private
  
    def self.parse_response(response)
      JSON.parse(response.body)
    end
  end
  