# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

john = User.create(name: 'John')
new_image = Image.create(image_url: 'http://1.bp.blogspot.com/-SHX9Fwu46xQ/UIkyg-UyWCI/AAAAAAAAAFQ/W7ESDg8qHoU/s1600/Disney_Cartoon_hd_wallpapers.jpg', published: true)
john.images << new_image
john.save
new_image.save
new_caption = Caption.create(message: 'Where did all your honey go, Pooh?')
new_image << new_caption
new_image.save
john << new_caption
new_caption.liked_by john
john.save
new_caption.save
