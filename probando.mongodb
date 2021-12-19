// https://docs.mongodb.com/manual/core/data-modeling-introduction/

use('ITAcademy-Pizzeria');



// The drop() command destroys all data from a collection.

db.store.drop();
db.client.drop();
db.product.drop();
db.order.drop();



db.store.insertOne({
    _id: "Store9874sadfah4321",
    name: "Antigourmet Comidas",
    street: "C. Churruca 56",
    phone_number: "+34913220310",
    pc: "118902",
    city: {
        city_id: "Bar65489674321",
        name: "Barcelona",},
    state: {
        state_id: "Cat897as8d7f5",
        name: "Catalunya"
    },
    employee:
    {
        _id: "Emp9875132465",
        name: "Diego Armando",
        last_name: "Maradona",
        nif: "M869756Y",
        phone_number: "+34 68754",
        position: "delivery_man",
        store_id: "Store9874sadfah4321"
    
    }
})

db.client.insertOne({
    _id: "Cli9875132465",
    name: "Jose",
    last_name: "Perez",
    street: "Pg. de Gràcia, 16, 08008 Barcelona",
    city: "Bar65489674321",
    phone_number: "+34 05468753",
    city: {
        city_id: "Bar65489674321",
        name: "Barcelona",},
    state: {
        state_id: "Cat897as8d7f5",
        name: "Catalunya"
        }

})


db.product.insertMany([{
        _id: "HWPa897512313657",
        name: "Hawaiian pizza",
        description: "Hawaiian pizza is a type of pizza originating in Canada, best known for having pineapple and either ham or bacon as toppings.",
        picture: "https://upload.wikimedia.org/wikipedia/commons/e/ea/Pizza_with_pineapple.jpg",
        price: 1235,
        pizza_category: {
            pizza_category_id: "pizCat8764321",
            name: "Some category name I can't came up with"
        }
    },

    {
        _id: "CHBa897512313657",
        name: "Cheeseburger",
        description: "A cheeseburger is a hamburger topped with cheese.",
        picture: "https://es.m.wikipedia.org/wiki/Archivo:Cheeseburger.jpg",
        price: 1235,


    }
])

db.order.insertOne({
    order_date_and_time: ISODate("2012-12-19T06:01:17.171Z"),
    store_id: "Store9874sadfah4321",
    for_delivery: true,
    delivery_man_id: "Emp9875132465",
    delivery_time: ISODate("2012-12-19T06:01:37.171Z"),
    client_id: "Cli9875132465",

    shopping_cart: [{ product_id: "HWPa897512313657", quantity: 1 }],
    total_price: 1235

})