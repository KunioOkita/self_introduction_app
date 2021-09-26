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

table_names = %w(
  divisions
  users
)

table_names.each do |table_name|
  path = Rails.root.join("db/seeds/#{Rails.env}/#{table_name}.rb")

  # ファイルが存在しない場合はdevelopmentディレクトリを読み込む
  path = path.sub(Rails.env, "development") unless File.exist?(path)

  puts "#{table_name}..."
  require path
end

# skill_categories
skill_categories = {
  "プログラミング言語" => %w(
    Bash
    BASIC
    C
    C#
    C++
    COBOL
    CoffeeScript
    D
    Dart
    FORTRAN
    Go
    Google\ Apps\ Script
    Groovy
    Haskell
    Java
    JavaScript
    JSX
    Kotlin
    LISP
    Lua
    Objective-C
    Perl
    PHP
    PowerShell
    Python
    R
    Ruby
    Rust
    Scala
    Smalltalk
    Swift
    Tex
    TypeScript
    VBScript
    Visual\ Basic
    XSLT
    zsh
  ),
  "アプリケーションフレームワーク" => %w(
    ASP.NET
    Grails
    Apache\ Struts
    GWT
    Spring
    Angular
    Backbone.js
    Express.js
    jQuery
    Node.js
    React
    Vue.js
    CakePHP
    FuelPHP
    Laravel
    Symfony
    Zend
    Django
    Flask
    Ruby\ on\ Rails
    Sinatra
  ),
  "データベース" => %w(
    PostgreSQL
    MySQL
    Oracle
    SQLite
    MongoDB
    SQL\ Server
    Google\ Data\ Store
  ),
  "OS" => %w(
    Linux
    Unix
    Windows
    Mac
    Android
    iOS
  ),
  "ミドルウェア" => %w(
    Apache
    Tomcat
    Nginx
  ),
  "パブリッククラウド" => %w(
    AWS
    GCP
    Azure
  )
}
skill_categories.each do |category, skills|
  skill_category = SkillCategory.create(name: category)
  skills.each do |skill|
    Skill.create(skill_category_id: skill_category.id, name: skill)
  end
end
