//Observaciones: Esta base de datos es buena candidata para hacer repeticion de informacion "hardcoded", por ejemplo, para cada cancion agregar el artistas en lugar de hacer una referencia. Es buena idea porque es poca la informacion a añadir, y no va a cambiar nunca. Esto permite devolver toda la informacion con una sola query. Aun asi, elegi añadir una referencia por objectID, que es indeaxo automaticamente.
//La relacion entre usuairio y subscripcion es uno a uno, y esta ultima solo se accede en el contexto del usuario, por lo tanto habria sido una buena idea que "subscription" fuera un embedded document de "user"

use('ITAcademy-spotify');



// The drop() command destroys all data from a collection.
db.artist.drop(); //
db.user.drop()
db.playlist.drop();
db.subscription.drop()

db.artist.insertMany([{
    _id: "Dire87d3a1564s6d5",
    artist_name: "Dire Straits",
    artist_picture: "https://upload.wikimedia.org/wikipedia/commons/a/a2/Dire_straits_22101985_23_800.jpg",
    albums: [{
        album_id: "Bro65sad8f65as465sf",
        album_title: "Brothers in Arms",
        release_date: ISODate("1985-09-09T06:00:00.171Z"),
        cover_image: "https://en.wikipedia.org/wiki/Brothers_in_Arms_(album)#/media/File:DS_Brothers_in_Arms.jpg",
        songs: [{
            song_id: "Money1a897512313657",
            title: "Money For Nothing",
            artist: "Dire87d3a1564s6d5",
            length: 185,
            album: "Bro65sad8f65as465sf",
            number_of_shares: 6598771,
        },
        {
            song_id: "Sofar6sa5d4f65s6sa5",
            title: "So Far Away",
            artist: "Dire87d3a1564s6d5",
            length: 185,
            album: "Bro65sad8f65as465sf",
            number_of_shares: 300224,
    
        }]
    }]

}, {
    _id: "Super87d3a1564s6d5",
    artist_name: "Supertramp",
    artist_picture: "https://en.wikipedia.org/wiki/Supertramp#/media/File:Supertramp1971.jpg",
    related_artists: ["Dire87d3a1564s6d5"],
    albums:[{
        album_id: "Freea6s5df4d56",
        album_title: "Free as a Bird",
        song_list: ["alright65asd4f65as47"],
        artist_id: "Super87d3a1564s6d5",
        release_date: ISODate("1987-09-09T06:00:00.171Z"),
        cover_image: "https://en.wikipedia.org/wiki/File:Supertramp_-_Free_As_a_Bird.jpg",
        songs: [{
            song_id: "alright65asd4f65as47",
            title: "It's Alright",
            artist: "Super87d3a1564s6d5",
            length: 123,
            album: "Freea6s5df4d56",
            number_of_shares: 65496,}]
    
    }]
}])

db.user.insertMany([{
    _id: "User1prem96as5fd464",
    user_name: "winter_life",
    email: "winter_life@email.com",
    password: "ASDKJFL654",
    date_bron: ISODate("2020-09-09T06:00:00.171Z"),
    sex: "F",
    country: "Italy",
    cp: "LO9874",
    is_premium: true,
    subscription: "subs6sad5fs654f",
    favorite_songs: ["Money1a897512313657", "Sofar6sa5d4f65s6sa5"],
    favorite_albums: ["Freea6s5df4d56", "Bro65sad8f65as465sf"],
    favorite_artists: ["Dire87d3a1564s6d5", "Super87d3a1564s6d5"]
}, {
    _id: "User2Free65ads465sdfg",
    user_name: "rafaelIopu999",
    email: "rafael_iopu@email.com",
    password: "password123",
    date_bron: ISODate("1996-09-09T06:00:00.171Z"),
    sex: "M",
    country: "Greece",
    cp: "T6547",
    is_premium: false,
    favorite_songs: ["Sofar6sa5d4f65s6sa5"],
    favorite_albums: ["Bro65sad8f65as465sf"],
    favorite_artists: ["Dire87d3a1564s6d5"]
}])

db.playlist.insertOne({
    _id: "PL4as65df46sa5d4",
    title: "Best songs from the 90's and 80's",
    number_of_songs: 2,
    creation_date: ISODate("2021-06-03T06:00:00.171Z"),
    user_owner: "User1prem96as5fd464",
    is_shared: true,
    users_shared_with: ["User2Free65ads465sdfg"],
    visibility_state: "public",
    song_list: [
        { song: "Money1a897512313657", added_by: "User1prem96as5fd464", date_added: ISODate("2021-07-07T06:00:00.171Z") },
        { song: "Sofar6sa5d4f65s6sa5", added_by: "User1prem96as5fd464", date_added: ISODate("2021-08-08T06:00:00.171Z") },
        { song: "alright65asd4f65as47", added_by: "User2Free65ads465sdfg", date_added: ISODate("2021-09-09T06:00:00.171Z") }
    ],
    has_been_deleted: false,
})

db.subscription.insertOne({
    _id: "subs6sad5fs654f",
    start_date: ISODate("2020-06-03T06:00:00.171Z"),
    renewal_date: ISODate("2022-06-03T06:00:00.171Z"),
    payment_methods: {
        pay_pal: {
            username: "some_paypal_Username"
        }
    },
    payments: [{
        payment_method: "pay_pal",
        payment_date: ISODate("2020-06-03T06:00:00.171Z"),
        order_number: 45512,
        total: 6000,
    }, {
        payment_method: "pay_pal",
        payment_date: ISODate("2021-06-03T06:00:00.171Z"),
        order_number: 58964,
        total: 6000,
    }]


})