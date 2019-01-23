
require_all 'models'

a1 = Artist.create(name: 'Picasso', culture: 'Spanish')
u1 = User.create(name: 'ME')
au1 = ArtistUser.create(artist_id: a1, user_id: u1)

a2 = Artist.create(name: 'Andy Warhol', culture: 'American')
u2 = User.create(name: 'David')
au2 = ArtistUser.create(artist_id: a1, user_id: u2)

a3 = Artist.create(name: 'Van Gogh', culture: 'Dutch')
u3 = User.create(name: 'Joe')
au3 = ArtistUser.create(artist_id: a3, user_id: u3)

a4 = Artist.create(name: 'Georgia OKeefe', culture: 'American')
au4 = ArtistUser.create(artist_id: a4, user_id: u2)
