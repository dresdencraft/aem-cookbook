actions :configure

attribute :http_disabled, kind_of: String, default: nil
attribute :ssl_enabled, kind_of: String, default: nil
attribute :ssl_port, kind_of: Integer, default: nil
attribute :keystore_pkcs12_base64, kind_of: String, default: nil
attribute :keystore_path, kind_of: String, default: nil
attribute :keystore_password, kind_of: String, default: nil
