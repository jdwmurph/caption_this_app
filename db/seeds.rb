# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

john = User.create(name: 'John', password: 'test', email: 'example@example.com')
new_image = Image.create(image_url: 'http://1.bp.blogspot.com/-SHX9Fwu46xQ/UIkyg-UyWCI/AAAAAAAAAFQ/W7ESDg8qHoU/s1600/Disney_Cartoon_hd_wallpapers.jpg', published: true)
john.images << new_image
john.save
new_image.save
new_caption = Caption.create(message: 'Where did all your honey go, Pooh?')
new_image.captions << new_caption
new_image.save
new_caption.save
john.captions << new_caption
new_caption.liked_by john
john.save
new_caption.save

bod = User.create(name: 'Bod', password: 'test', email: 'example@example.com')
bod_image = Image.create(image_url: 'http://photos-h.ak.instagram.com/hphotos-ak-ash/10296696_1553438401549511_2107283718_n.jpg', published: true)
bod.images << bod_image
another_image = Image.create(image_url: 'http://scontent-b.cdninstagram.com/hphotos-prn/t51.2885-15/10369445_549040095216871_1521148060_n.jpg', published: true)
bod.images << another_image

bod = User.create(name: 'Lichard', password: 'test', email: 'example@example.com')
bod_image = Image.create(image_url: 'http://origincache-frc.fbcdn.net/10401739_832301463465107_588950918_n.jpg', published: true)
bod.images << bod_image
another_image = Image.create(image_url: 'http://thenypost.files.wordpress.com/2014/01/star-wars-4.jpg', published: true)
bod.images << another_image

bod = User.create(name: 'Bernard', password: 'test', email: 'example@example.com')
bod_image = Image.create(image_url: 'http://static3.businessinsider.com/image/50b675c869beddf002000008-960/star-wars-han-solo-chewbacca.jpg', published: true)
bod.images << bod_image
another_image = Image.create(image_url: 'http://thesarcasticcaveman.files.wordpress.com/2013/06/yoda_surprised.jpg', published: true)
bod.images << another_image

bod = User.create(name: 'George', password: 'test', email: 'example@example.com')
bod_image = Image.create(image_url: 'http://whydidmydadmakemeametsfan.files.wordpress.com/2013/03/jordany-valdespin.jpg', published: true)
bod.images << bod_image
another_image = Image.create(image_url: 'http://cmsimg.ithacajournal.com/apps/pbcsi.dll/bilde?Site=CB&Date=20140419&Category=SPORTS&ArtNo=304190049&Ref=AR&MaxW=300&Border=0&Braves-pull-Kimbrel-hold-off-Mets-7-5', published: true)
bod.images << another_image
bod_image = Image.create(image_url: 'http://static.guim.co.uk/sys-images/Guardian/About/General/2013/11/28/1385648265854/Orangutans-Laughing-007.jpg', published: true)
bod.images << bod_image


