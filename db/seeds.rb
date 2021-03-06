# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# 条件を指定して初めの1件を取得し1件もなければ作成(create)
Maker.find_or_create_by(maker_name: "日産")
Maker.find_or_create_by(maker_name: "トヨタ")
Maker.find_or_create_by(maker_name: "スバル")
Maker.find_or_create_by(maker_name: "ホンダ")
Maker.find_or_create_by(maker_name: "マツダ")
Maker.find_or_create_by(maker_name: "三菱")
Maker.find_or_create_by(maker_name: "ダイハツ")
Maker.find_or_create_by(maker_name: "スズキ")
Maker.find_or_create_by(maker_name: "その他")

Theme.find_or_create_by(theme_text: "車が好きになったきっかけ")
Theme.find_or_create_by(theme_text: "所有して良かったこと")
Theme.find_or_create_by(theme_text: "ドライブに合うお気に入りの音楽")

