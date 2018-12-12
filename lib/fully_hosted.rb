module FullyHosted
  def FullyHosted.get_link(options)
    raise 'No options object provided' unless options
    raise 'Missing injection params' unless options[:params]

    encrypted = encrypt(URI.encode_www_form(options[:params]), FullyHosted::PUBLIC_KEY)
    query_string = {
      ic_user_id: options[:IC_USER_ID],
      c: 1,
      l: FullyHosted::LANGUAGE,
      v: FullyHosted::VERSION
    }
    [:downloadAs, :fallback_url].each do |option|
      query_string[option] = options[option] if options[option]
    end

    url = URI.parse("#{FullyHosted::SERVICE_DOMAIN}?#{URI.encode_www_form query_string}")

    http = Net::HTTP.new url.host, url.port
    http.read_timeout = 10
    req = Net::HTTP::Post.new url.request_uri
    req['User-Agent'] = options[:user_agent] if options[:user_agent]
    req['X-Forwarded-For'] = options[:x_forwarded_for] if options[:x_forwarded_for]
    req.set_form_data encrypted
    link = http.request(req).body
    link = URI.encode(link)
    return link if URI.parse(link).hostname
    "#{FullyHosted::DEFAULT_DOMAIN}#{link[1..-1]}"
  end

  def FullyHosted.get_key(public_key)
    random_key = SecureRandom.random_bytes(16)
    sha256 = Digest::SHA256.hexdigest random_key
    rsa = OpenSSL::PKey::RSA.new public_key
    encrypted_key = rsa.public_encrypt random_key
    return encrypted_key, random_key
  end

  def FullyHosted.encrypt(data, public_key)
    encrypted_key, random_key = get_key(public_key)
    cipher = OpenSSL::Cipher::RC4.new
    cipher.key = random_key
    cipher.encrypt
    base64_data = Base64.encode64(cipher.update(data) + cipher.final)
    base64_key = Base64.encode64 encrypted_key
    return {
      data: base64_data,
      key: base64_key
    }
  end
end
