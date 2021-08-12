class User < ApplicationRecord
  def self.create_from_auth_hash!(auth_hash)
    provider = auth_hash[:provider]
    uid = auth_hash[:provider]
    name = auth_hash.dig(:extra, :raw_info, :displayName)
    mail = auth_hash.dig(:extra, :raw_info, :mail) ||
           auth_hash.dig(:extra, :raw_info, :userPrincipalName)

    User.find_or_create_by!(provider: provider, uid: uid) do |user|
      user.name = name
      user.mail = mail
    end
  end
end
