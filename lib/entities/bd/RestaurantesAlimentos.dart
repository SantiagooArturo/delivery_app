import 'package:delivery_app/entities/bd/Alimento.dart';
import 'package:delivery_app/entities/bd/Restaurante.dart';

List<Restaurante> restaurantes = [
  Restaurante(
    '1',
    'McDonald\'s',
    '123 Main St, New York, NY',
    [
      Alimento('1', 'Big Mac', 5.99, 'https://images.pexels.com/photos/2251277/pexels-photo-2251277.jpeg', 'Hamburguesa clásica con dos carnes'),
      Alimento('2', 'McNuggets', 4.99, 'https://images.pexels.com/photos/1759272/pexels-photo-1759272.jpeg', 'Nuggets de pollo crujientes'),
    ],
  ),
  Restaurante(
    '2',
    'Starbucks',
    '456 Broadway, New York, NY',
    [
      Alimento('3', 'Caffè Latte', 4.49, 'https://images.pexels.com/photos/3778941/pexels-photo-3778941.jpeg', 'Café con leche y espuma'),
      Alimento('4', 'Croissant', 2.99, 'https://images.pexels.com/photos/260791/pexels-photo-260791.jpeg', 'Croissant recién horneado'),
    ],
  ),
  Restaurante(
    '3',
    'Pizza Hut',
    '789 Elm St, Chicago, IL',
    [
      Alimento('5', 'Pizza Pepperoni', 12.99, 'https://images.pexels.com/photos/1761278/pexels-photo-1761278.jpeg', 'Pizza con pepperoni'),
      Alimento('6', 'Alitas de Pollo', 9.99, 'https://images.pexels.com/photos/3668936/pexels-photo-3668936.jpeg', 'Alitas de pollo con salsa'),
    ],
  ),
  Restaurante(
    '4',
    'Subway',
    '101 Oak St, Los Angeles, CA',
    [
      Alimento('7', 'Sub de Pollo', 7.99, 'https://images.pexels.com/photos/1741903/pexels-photo-1741903.jpeg', 'Sándwich de pollo con vegetales'),
      Alimento('8', 'Sub Veggie', 6.99, 'https://images.pexels.com/photos/273283/pexels-photo-273283.jpeg', 'Sándwich vegetariano'),
    ],
  ),
  Restaurante(
    '5',
    'Taco Bell',
    '202 Pine St, San Francisco, CA',
    [
      Alimento('9', 'Crunchwrap Supreme', 8.49, 'https://images.pexels.com/photos/669574/pexels-photo-669574.jpeg', 'Crunchwrap con carne y queso'),
      Alimento('10', 'Tacos', 6.99, 'https://images.pexels.com/photos/546393/pexels-photo-546393.jpeg', 'Tacos con carne y vegetales'),
    ],
  ),
  Restaurante(
    '6',
    'KFC',
    '303 Maple Ave, Houston, TX',
    [
      Alimento('11', 'Pollo Frito', 10.99, 'https://images.pexels.com/photos/4005434/pexels-photo-4005434.jpeg', 'Pollo frito crujiente'),
      Alimento('12', 'Papas Fritas', 3.99, 'https://images.pexels.com/photos/1448511/pexels-photo-1448511.jpeg', 'Papas fritas doradas'),
    ],
  ),
  Restaurante(
    '7',
    'Chipotle',
    '404 Cedar St, Seattle, WA',
    [
      Alimento('13', 'Burrito de Carne Asada', 9.99, 'https://images.pexels.com/photos/3829543/pexels-photo-3829543.jpeg', 'Burrito con carne asada y guacamole'),
      Alimento('14', 'Ensalada de Pollo', 8.49, 'https://images.pexels.com/photos/1314172/pexels-photo-1314172.jpeg', 'Ensalada con pollo y aderezo'),
    ],
  ),
  Restaurante(
    '8',
    'Panera Bread',
    '505 Birch St, Boston, MA',
    [
      Alimento('15', 'Sopa de Pan', 6.99, 'https://images.pexels.com/photos/1112062/pexels-photo-1112062.jpeg', 'Sopa servida en un pan'),
      Alimento('16', 'Sándwich de Pavo', 7.49, 'https://images.pexels.com/photos/3731241/pexels-photo-3731241.jpeg', 'Sándwich de pavo con vegetales'),
    ],
  ),
  Restaurante(
    '9',
    'Domino\'s Pizza',
    '606 Spruce St, Miami, FL',
    [
      Alimento('17', 'Pizza de Queso', 10.99, 'https://images.pexels.com/photos/1314180/pexels-photo-1314180.jpeg', 'Pizza con mucho queso'),
      Alimento('18', 'Palitos de Pan', 5.99, 'https://images.pexels.com/photos/3408749/pexels-photo-3408749.jpeg', 'Palitos de pan con ajo'),
    ],
  ),
  Restaurante(
    '10',
    'Five Guys',
    '707 Willow St, Philadelphia, PA',
    [
      Alimento('19', 'Hamburguesa Doble', 11.99, 'https://images.pexels.com/photos/281278/pexels-photo-281278.jpeg', 'Hamburguesa doble con toppings'),
      Alimento('20', 'Papas Fritas', 4.99, 'https://images.pexels.com/photos/1008432/pexels-photo-1008432.jpeg', 'Papas fritas con sal'),
    ],
  ),
  Restaurante(
    '11',
    'Panda Express',
    '808 Elm St, Atlanta, GA',
    [
      Alimento('21', 'Orange Chicken', 9.49, 'https://images.pexels.com/photos/1631165/pexels-photo-1631165.jpeg', 'Pollo a la naranja'),
      Alimento('22', 'Arroz Frito', 6.49, 'https://images.pexels.com/photos/1617121/pexels-photo-1617121.jpeg', 'Arroz frito con vegetales'),
    ],
  ),
  Restaurante(
    '12',
    'Chick-fil-A',
    '909 Oak St, Denver, CO',
    [
      Alimento('23', 'Chicken Sandwich', 5.99, 'https://images.pexels.com/photos/1679619/pexels-photo-1679619.jpeg', 'Sándwich de pollo frito'),
      Alimento('24', 'Papas Fritas', 3.99, 'https://images.pexels.com/photos/1679650/pexels-photo-1679650.jpeg', 'Papas fritas crujientes'),
    ],
  ),
  Restaurante(
    '13',
    'Olive Garden',
    '1010 Pine St, Dallas, TX',
    [
      Alimento('25', 'Pasta Alfredo', 13.99, 'https://images.pexels.com/photos/1340758/pexels-photo-1340758.jpeg', 'Pasta con salsa Alfredo'),
      Alimento('26', 'Pan de Ajo', 5.49, 'https://images.pexels.com/photos/3292545/pexels-photo-3292545.jpeg', 'Pan de ajo recién horneado'),
    ],
  ),
  Restaurante(
    '14',
    'Red Lobster',
    '1111 Maple Ave, Orlando, FL',
    [
      Alimento('27', 'Langosta a la Parrilla', 17.99, 'https://images.pexels.com/photos/212981/pexels-photo-212981.jpeg', 'Langosta a la parrilla con mantequilla'),
      Alimento('28', 'Camarones a la Parrilla', 12.99, 'https://images.pexels.com/photos/3498034/pexels-photo-3498034.jpeg', 'Camarones a la parrilla con ajo'),
    ],
  ),
  Restaurante(
    '15',
    'The Cheesecake Factory',
    '1212 Cherry St, San Diego, CA',
    [
      Alimento('29', 'Cheesecake de Fresa', 7.99, 'https://images.pexels.com/photos/4475721/pexels-photo-4475721.jpeg', 'Cheesecake con fresas'),
      Alimento('30', 'Ensalada de Pollo', 9.49, 'https://images.pexels.com/photos/1533721/pexels-photo-1533721.jpeg', 'Ensalada con pollo a la parrilla'),
    ],
  ),
];
