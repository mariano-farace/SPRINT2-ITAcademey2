// https://docs.mongodb.com/manual/core/data-modeling-introduction/

// Select the database to use.
use('ITAcademy');

// The drop() command destroys all data from a collection.
// Make sure you run it against the correct database and collection.


db.employee.drop();
db.client.drop();
db.glassesSupplieer.drop();
db.sale.drop();
db.glasses.drop()



db.employee.insertOne({
    _id: "65489674321",
    name: "Roberto",
    last_name: "Gomez"
})


db.client.insertMany([{
        _id: "9875132465",
        name: "Jose",
        last_name: "Perez",
        postal_address: "Pg. de Gràcia, 16, 08008 Barcelona",
        phone_number: "+34 05468753",
        e_mail: "random@email.com",
        registration_date: ISODate("2010-09-24"),
        referred_by_client: "another client ID"

    },
    {
        _id: "87512346875",
        name: "Monica",
        last_name: "Escala",
        postal_address: "Carrer de les Carolines, 20-26, 08012 Barcelona",
        phone_number: "54654321 112",
        e_mail: "another_random@email.com",
        registration_date: new Date(),
        referred_by_client: "9875132465"
    }
])


db.glasses.insertOne({
    _id: "897512313657",
    brand: "ike",
    graduation_r_lens: 1.32,
    graduation_l_lens: 6.82,
    frame_type: "metallic",
    frame_color: "purple",
    lens_color: "clear",
    price: 1532,
    stock: 198,
    glassesSupplier_Id: "9874516574321"
})

db.glassesSupplieer.insertOne({
    _id: "9874516574321",
    name: "Atlantic Eyewear SRL",
    address: {
        street: "C. Churruca",
        number: "6",
        floor: "3",
        door: "A",
        city: "Getafe",
        pc: "28902",
        country: "Spain"
    },
    phone_number: "+34913220310",
    fax: "987913220310",
    nif: "RL987654321",
    glass_brands: ["Calvin Klein", "Carrera", "Dior", "Dolce & Gabbana"]
})


db.sale.insertOne({
    sale_date: new Date(),
    sold_by: "65489674321",
    sold_to: "87512346875",
    shopping_cart: [{ glasses_id: "897512313657", quantity: 6 }]

})


db.sales.find({})