class ChatGptService
  include HTTParty
  base_uri 'https://api.openai.com/v1'

  def self.generate_response(prompt)
    response = post('/engines/gpt-3.5-turbo/completions', {
      body: {
        prompt: prompt,
        max_tokens: 100
      }.to_json
    })
  
    if response.body.nil? || response.body.empty?
      return "Error: Empty response from API"
    end
  
    parsed_response = JSON.parse(response.body)
  
    if parsed_response['choices'].is_a?(Array) && !parsed_response['choices'].empty?
      text = parsed_response['choices'][0]['text']
      return { response: text }
    else
      return { response: "Error: Invalid response format", parsed_response: parsed_response }
    end
  end
  
end
