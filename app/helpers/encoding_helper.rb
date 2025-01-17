require "base64"

module EncodingHelper
  def encode(str)
    encoded_str = Base64.encode64(str)
    encoded_str
  end
end
