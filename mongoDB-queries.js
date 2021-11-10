// Envía la URL a un repositorio llamado mongoDB-estructura que contenga la solución. Para cada base de datos debe subirse lo siguiente:

// Diagrama de estructura (Modelo Tree o Modelo Relationships) con el diseño de la base de datos. Puedes utilizar draw.io o cualquier otra herramienta que te permita dibujar la estructura y exportarla en formato png o jpg (para subirla al repositorio)

// Script .js de creación e introducción de datos de la base de datos. El script se ejecutará desde la consola
// Select the database to use.
use('ITAcademy');
db.restaurants.findOne({})

//1 Escribe una consulta para mostrar todos los documentos en la colección Restaurantes
use('ITAcademy');

db.restaurants.find({})


//2 Escribe una consulta para mostrar restaurante_id, name, borough y cuisine para todos los documentos en la colección Restaurantes
use('ITAcademy');
db.restaurants.find({}, { restaurant_id: 1, _id: 0, name: 1, borough: 1, cuisine: 1 })

//3 Escribe una consulta para mostrar el restaurante_id, name, borough y cuisine, pero excluir el campo _id por todos los documentos en la colección Restaurantes
use('ITAcademy');
db.restaurants.find({}, { restaurant_id: 1, name: 1, borough: 1, cuisine: 1, _id: 0 })

//4Escribe una consulta para mostrar restaurant_id, name, borough y zip code, pero excluir el campo _id por todos los documentos en la colección Restaurantes

use('ITAcademy');
db.restaurants.find({}, { restaurant_id: 1, name: 1, borough: 1, address: { zipcode: 1 }, _id: 0 })

//5 Escriu una consulta per mostrar tot els restaurants que estan en el Bronx
use('ITAcademy');
db.restaurants.find({ borough: "Bronx" })

//6 Escriu una consulta per mostrar els primers 5 restaurants que estan en el Bronx
use('ITAcademy');
db.restaurants.find({ borough: "Bronx" }).limit(5)

//7 Escriu una consulta per mostrar el pròxim 5 restaurants després de saltar els primers 5 del Bronx
use('ITAcademy');
db.restaurants.find({ borough: "Bronx" }).skip(5).limit(5)

//8 Escriu una consulta per trobar els restaurants que tenen un score de més de 90
use('ITAcademy');

db.restaurants.find({ "grades.score": { $gt: 90 } })

//9 Escriu una consulta per trobar els restaurants que tenen un score de més que 80 però menys que 100
use('ITAcademy');

db.restaurants.find({ "grades.score": { "$gt": 80, "$lt": 100 } })

//10 Escriu una consulta per trobar els restaurants quins localitzen en valor de latitud menys que -95.754168

use('ITAcademy');

db.restaurants.find({ "address.coord.0": { "$lt": -95.754168 } })

//11 Escriu una consulta de MongoDB per a trobar els restaurants que no preparen cap cuisine de 'American' i el seu puntaje de qualificació superior a 70 i latitud inferior a -65.754168
use('ITAcademy');

//Remember that the $not operator only affects other operators and cannot check fields and documents independently. So, use the $not operator for logical disjunctions and the $ne operator to test the contents of fields directly.

//No cual seria el mas apropiado, pero funciona el $not, y como lo puse antes de saber de $ne, asi lo dejo
db.restaurants.find({
    cuisine: { $not: { $eq: "American " } },
    "grades.score": { $gt: 70 },
    "address.coord.0": { "$lt": -65.754168 },
})


//12 Escriu una consulta per trobar els restaurants quins no preparen cap cuisine de 'American' i va aconseguir un marcador més que 70 i localitzat en la longitud menys que -65.754168. Nota : Fes aquesta consulta sense utilitzar $and operador
use('ITAcademy');

db.restaurants.find({
    $and: [{ cuisine: { $not: { $eq: "American " } } },
        { "grades.score": { $gt: 70 } },
        { "address.coord.0": { "$lt": -65.754168 } }
    ]
})


//13 Escriu una consulta per trobar els restaurants quins no preparen cap cuisine de 'American ' i va aconseguir un punt de grau 'A' no pertany a Brooklyn. S'ha de mostrar el document segons la cuisine en ordre descendent
use('ITAcademy');
db.restaurants.find({
    cuisine: { $not: { $eq: "American " } },
    "grades.grade": "A",
    borough: { $not: { $eq: "Brooklyn" } },
}).sort({ cuisine: -1 })

//14 Escriu una consulta per trobar el restaurant_id, name, borough i cuisine per a aquells restaurants quin contenir 'Wil' com les tres primeres lletres en el seu nom
use('ITAcademy');

db.restaurants.find({ name: /^Wil/ }, { restaurant_id: 1, _id: 0, name: 1, borough: 1, cuisine: 1 })

//15 Escriu una consulta per trobar el restaurant_id, name, borough i cuisine per a aquells restaurants quin contenir 'ces' com les últim tres lletres en el seu nom
use('ITAcademy');

db.restaurants.find({ name: /ces$/ }, { restaurant_id: 1, _id: 0, name: 1, borough: 1, cuisine: 1 })

//16 Escriu una consulta per trobar el restaurant_id, name, borough i cuisine per a aquells restaurants quin contenir 'Reg' com tres lletres en algun lloc en el seu nom
use('ITAcademy');
db.restaurants.find({ name: /Reg/i }, { restaurant_id: 1, _id: 0, name: 1, borough: 1, cuisine: 1 })

//17 Escriu una consulta per trobar els restaurants quins pertanyen al Bronx i va preparar qualsevol plat American o xinès
use('ITAcademy');
db.restaurants.find({ borough: "Bronx", cuisine: { $in: ["American ", "Chinese"] } })


//18 Escriu una consulta per trobar el restaurant_id, name, borough i cuisine per a aquells restaurants que pertanyen a Staten Island o Queens o Bronx  Brooklyn
use('ITAcademy');

db.restaurants.find({ borough: { $in: ["Bronx", "Brooklyn", "Queens", "Staten Island", ] } }, { restaurant_id: 1, _id: 0, name: 1, borough: 1, cuisine: 1 })

//19 Escriu una consulta per trobar el restaurant_id, name, borough i cuisine per a aquells restaurants que no pertanyen a Staten Island o Queens o Bronx o Brooklyn
use('ITAcademy');
db.restaurants.find({ borough: { $nin: ["Bronx", "Brooklyn", "Queens", "Staten Island", ] } }, { restaurant_id: 1, _id: 0, name: 1, borough: 1, cuisine: 1 })

//20 Escriu una consulta per trobar el restaurant_id, name, borough i cuisine per a aquells restaurants que aconsegueixin un marcador quin no és més que 10
use('ITAcademy');
db.restaurants.find({
    "grades.score": { $lte: 10 },
}, { restaurant_id: 1, _id: 0, name: 1, borough: 1, cuisine: 1 })

//21 Escribe una consulta para encontrar el restaurante_id, name, borough y cuisine para aquellos restaurantes que preparan marisco ('seafood') excepto 'American' y 'Chinees' o el name del restaurante comienza con letras 'Wil'
use('ITAcademy');
db.restaurants.find({
    $and: [
        { cuisine: { $in: ["Seafood"] } },
        { cuisine: { $nin: ["American ", "Chinese"] } },
        { name: { $nin: [/^Wil/] } }
    ]
}, { restaurant_id: 1, _id: 0, name: 1, borough: 1, cuisine: 1 })


//22 Escribe una consulta para encontrar el restaurante_id, name, y gradas para aquellos restaurantes que consigan un grado "A" y un score 11 en datos de estudio ISODate "2014-08-11T00:00:00Z"
use('ITAcademy');

db.restaurants.find({
    "grades.grade": "A",
    "grades.score": 11,
    "grades.date": ISODate("2014-08-11T00:00:00Z")
}, { restaurant_id: 1, _id: 0, name: 1, grades: 1 })


//23 Escribe una consulta para encontrar el restaurante_id, name y gradas para aquellos restaurantes donde el 2º elemento de variedad de grados contiene un grado de "A" y marcador 9 sobre un ISODate "2014-08-11T00:00:00Z"
use('ITAcademy');

db.restaurants.find({
    "grades.1.grade": "A",
    "grades.1.score": 9,
    "grades.1.date": ISODate("2014-08-11T00:00:00Z")
}, { restaurant_id: 1, _id: 0, name: 1, grades: 1 })


//24 Escribe una consulta para encontrar el restaurante_id, name, dirección y ubicación geográfica para aquellos restaurantes en los que el segundo elemento del array coord contiene un valor cuál es más que 42 y hasta 52
use('ITAcademy');

db.restaurants.find({
    "address.coord.1": { "$gt": 42, "$lt": 52 }
}, { restaurant_id: 1, _id: 0, name: 1, address: 1 })

//25 Escribe una consulta para organizar el nombre de los restaurantes en orden ascendente junto con todas las columnas

use('ITAcademy');
db.restaurants.find({}).sort({ name: 1 })



//26 Escribe una consulta para organizar el nombre de los restaurantes al descender junto con todas las columnas
use('ITAcademy');
db.restaurants.find({}).sort({ name: -1 })


//27 Escribe una consulta a organizar el nombre de la cuisine en orden ascendente y por el mismo barrio de cuisine. Orden descendiendo

use('ITAcademy');
db.restaurants.find({}).sort({ borough: -1, cuisine: 1 })

//28 Escribe una consulta para saber tanto si todas las direcciones contienen la calle o no
use('ITAcademy');
db.restaurants.find({
    "address.street": { $exists: false }
})

//29 Escribe una consulta cuál seleccionará todos los documentos en la colección de restaurantes donde el valor del campo coord es Double

//For documents where field is an array, $type returns documents in which at least one array element matches a type passed to $type.

//por lo anterior, estrictamente deberia probar que los dos elementos de la coordenada son double, como lo escribi aca, solo me dice que al menos UNO es tipo double

use('ITAcademy');
db.restaurants.find({
    "address.coord": { $type: "double" }
})


//30 Escribe una consulta cuál seleccionará el restaurante_id, name y grade para aquellos restaurantes qué retornos 0 como resto después de dividir el marcador por 7  //{ field: { $mod: [ divisor, remainder ] } }
use('ITAcademy');

db.restaurants.find({
    "grades.score": { $mod: [7, 0] },
}, { restaurant_id: 1, _id: 0, name: 1, grades: 1 })



//31 Escribe una consulta para encontrar el name de restaurante, borough, longitud y altitud y cuisine para aquellos restaurantes que contienen 'mon' como tres letras en algún lugar de su name

use('ITAcademy');
db.restaurants.find({
    name: /mon/i
}, { restaurant_id: 1, _id: 0, name: 1, borough: 1, cuisine: 1 })

//32 Escribe una consulta para encontrar el name de restaurante, borough, longitud y latitud y cuisine para aquellos restaurantes que contienen 'Mad' como primeras tres letras de su name

use('ITAcademy');
db.restaurants.find({
    name: /^Mad/i
}, { _id: 0, name: 1, borough: 1, cuisine: 1, "address.coord": 1 })