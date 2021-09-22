# coding: utf-8

require 'securerandom'

def create_random_intoroduction
  char_num = rand(10..100)
  SecureRandom.base64(char_num)
end

provider = "microsoft_graph_auth"
mail_suffix = "@example.jp"
(1..20).each do |n|
  uid = SecureRandom.uuid
  name = format("user%03<number>d", number: n)
  mail = "#{name}#{mail_suffix}"
  user = User.create(provider: provider, uid: uid, name: name, mail: mail)
  user_self_introduction = UserSelfIntroduction.create(user_id: user.id, birth_place: "出身地", hobby: "趣味", introduction: create_random_intoroduction)
  image_file_name = format("test%03<number>d.jpg", number: n)
  image_file_path = Rails.root.join('app/assets/images/' + image_file_name)
  user_self_introduction.self_image.attach(io: File.open(image_file_path), filename: image_file_name)
end
