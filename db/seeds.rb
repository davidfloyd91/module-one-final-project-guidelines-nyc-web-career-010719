
require_all "../modules"

a1 = Artist.create(name: 'Picasso', 'Spanish')
u1 = User.create(name: 'ME')
au1 = ArtistUser.create(a1, u1)

a2 = Artist.create(name: 'Andy Warhol', 'American')
u2 = User.create(name: 'David')
au2 = ArtistUser.create(a1, u2)

a3 = Artist.create(name: 'Van Gogh', 'Dutch')
u3 = User.create(name: 'Joe')
au3 = ArtistUser.create(a3, u3)

a4 = Artist.create(name: 'Georgia OKeefe', 'American')
au4 = ArtistUser.create(a4, u2)
