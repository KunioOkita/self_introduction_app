# coding: utf-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#
# MasterData
#
# departments
department_division_map = {
  "経営企画部" => ["経営企画部"],
  "業務部" => ["人事担当", "設備担当", "ISMS推進担当", "事務管理担当"],
  "開発企画部" => ["開発企画部"],
  "開発部" => ["システムサービスマネージメント", "システムソリューション"]
}
department_division_map.each do |department_name, divisions|
  department = Department.create(name: department_name)
  divisions.each do |division|
    Division.create(department_id: department.id, name: division)
  end
end

# skill_categories
skill_categories = {
  "プログラミング言語" => ["C言語", "C++", "Java", "Ruby"],
  "アプリケーションフレームワーク" => ["Rails", "Spring"],
  "データベース" => ["PostgreSQL", "MySQL", "Oracle", "SQLite", "MongoDB"],
  "OS" => ["Linux", "Unix", "Windows", "Mac", "Android", "iOS"],
  "ミドルウェア" => ["Apache", "Tomcat", "Nginx"],
  "クラウドサービス" => ["AWS", "GCP", "Azure"]
}
skill_categories.each do |category, skills|
  skill_category = SkillCategory.create(name: category)
  skills.each do |skill|
    Skill.create(skill_category_id: skill_category.id, name: skill)
  end
end
#
# DummyUserData
#
provider = "microsoft_graph_auth"
mail_suffix = "@heartsoft.co.jp"
(1..20).each do |n|
  uid = SecureRandom.uuid
  name = format("user%03<number>d", number: n)
  mail = "#{name}#{mail_suffix}"
  user = User.create(provider: provider, uid: uid, name: name, mail: mail)
  UserSelfIntroduction.create(user_id: user.id, birth_place: "出身値", hobby: "趣味", introduction: "ひとこと")
end
