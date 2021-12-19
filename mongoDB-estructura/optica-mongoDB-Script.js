// https://docs.mongodb.com/manual/core/data-modeling-introduction/

// Select the database to use.
use('ITAcademy');

// The drop() command destroys all data from a collection.
// Make sure you run it against the correct database and collection.


db.client.drop();
db.glassesSupplier.drop();



db.client.insertOne({
        _id: "9875132465",
        name: "Jose",
        last_name: "Perez",
        postal_address: "Pg. de Gràcia, 16, 08008 Barcelona",
        phone_number: "+34 05468753",
        e_mail: "random@email.com",
        registration_date: ISODate("2010-09-24"),
        referred_by_client: "another client ID",
        glasses:{
        glasses_id: "897512313657",
        brand: "ike",
        graduation_r_lens: 1.32,
        graduation_l_lens: 6.82,
        frame_type: "metallic",
        frame_color: "purple",
        lens_color: "clear",
        price: 1532,
        stock: 198,
        glassesSupplier_Id: "9874516574321"},
        employee: {
        employee_id: "65489674321",
        name: "Ariel",
        last_name:"Gonzalez"        
    }
    })



db.glassesSupplier.insertOne({
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

