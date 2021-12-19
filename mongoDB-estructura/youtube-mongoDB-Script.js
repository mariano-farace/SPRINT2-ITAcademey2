// https://docs.mongodb.com/manual/core/data-modeling-introduction/

use('ITAcademy-youtube');



// The drop() command destroys all data from a collection.
db.user.drop();
db.comment.drop();
db.playlist.drop();
db.channel.drop();
db.video.drop()

db.user.insertMany([{
        _id: "User1a897512313657",
        user_name: "Mariano_6547",
        email: "mariano@email.com",
        password: "lakjsdflksj57",
        date_born: ISODate("1988-04-29T06:00:00.171Z"),
        sex: "M",
        country: "Antartica",
        cp: "654623"
    },

    {
        _id: "User2a897512313657",
        user_name: "hernan1926",
        email: "hernan@email.com",
        password: "qwe1273",
        date_born: ISODate("1926-04-29T06:00:00.171Z"),
        sex: "M",
        country: "Sudan",
        cp: "W8542124"

    }
])

db.video.insertOne({
    _id: "Vid65489674321",
    title: "The Endurance",
    description: "The Endurance is a 2000 documentary film directed by George Butler about Ernest Shackleton's legendary Antarctic expedition in 1914. It is based on the book of the same name. Endurance was the name of the ship of Shackleton's expedition.",
    size: 654687,
    file_name: "Vid65489674321.mp4",
    length: 7322,
    thumbnail: "https://en.wikipedia.org/wiki/The_Endurance:_Shackleton%27s_Legendary_Antarctic_Expedition#/media/File:The_Endurance_cover.jpg",
    views: 156,
    visibility_state: "public",
    user_owner: "User1a897512313657",
    date_published: ISODate("2021-10-12T06:00:00.171Z"),
    liked_disliked_by: [{
            user: "User1a897512313657",
            reaction: "like",
            reaction_date: ISODate("2021-10-13T06:00:00.171Z")
        },
        {
            user: "User2a897512313657",
            reaction: "dislike",
            reaction_date: ISODate("2021-10-13T06:06:09.171Z")
        }
    ],
    tags:[{tag_id:"6a5sd4f654", tag_name:"4K resolution"}],
    comments:[{
        comment_id: "lslsk78jdf765akl",
        comment_owner: "User2a897512313657",
        body: "I don't like your video",
        comment_date: ISODate("2021-10-13T06:00:00.171Z"),
        liked_disliked_by: [{
            user: "User1a897512313657",
            reaction: "dislike",
            reaction_date: ISODate("2021-10-13T06:00:00.171Z")
        }]
    }]
})


db.channel.insertOne({
    user_owner: "User1a897512313657",
    name: "Docummentaries",
    description: "This channel has the best docummentaries ever",
    creation_date: ISODate("2021-09-09T06:00:00.171Z"),
    users_subscribed: ["User2a897512313657"],
    video_list: ["Vid65489674321"]
})

db.playlist.insertOne({
    name: "Videos I do not like",
    creation_date: ISODate("2021-09-09T06:00:00.171Z"),
    user_owner: "User2a897512313657",
    visibility_state: "public",
    video_list: ["Vid65489674321"]
})