class Person {
  final String name;
  final String surname;
  final String email;
  final String image;

  Person(this.name, this.surname, this.email, this.image);
}

final List<Person> persons = _persons
    .map((e) => Person(e['name'], e['surname'], e['email'], e['image']))
.toList();

final List<Map<String, dynamic>> _persons = [
  {
    'name': 'Ivan',
    'surname': 'Ivanov',
    'email': 'user@gmail.com',
    'image': 'assets/images/1.png',
  },
  {
    'name': 'Ivan',
    'surname': 'Ivanov',
    'email': 'user@gmail.com',
    'image': 'assets/images/1.png',
  },
  {
    'name': 'Ivan',
    'surname': 'Ivanov',
    'email': 'user@gmail.com',
    'image': 'assets/images/1.png',
  },
  {
    'name': 'Ivan',
    'surname': 'Ivanov',
    'email': 'user@gmail.com',
    'image': 'assets/images/1.png',
  },
  {
    'name': 'Ivan',
    'surname': 'Ivanov',
    'email': 'user@gmail.com',
    'image': 'assets/images/1.png',
  },
  {
    'name': 'Ivan',
    'surname': 'Ivanov',
    'email': 'user@gmail.com',
    'image': 'assets/images/1.png',
  },
  {
    'name': 'Ivan',
    'surname': 'Ivanov',
    'email': 'user@gmail.com',
    'image': 'assets/images/1.png',
  },
  {
    'name': 'Ivan',
    'surname': 'Ivanov',
    'email': 'user@gmail.com',
    'image': 'assets/images/1.png',
  },
  {
    'name': 'Ivan',
    'surname': 'Ivanov',
    'email': 'user@gmail.com',
    'image': 'assets/images/1.png',
  },
  {
    'name': 'Ivan',
    'surname': 'Ivanov',
    'email': 'user@gmail.com',
    'image': 'assets/images/1.png',
  },
  {
    'name': 'Ivan',
    'surname': 'Ivanov',
    'email': 'user@gmail.com',
    'image': 'assets/images/1.png',
  },
  {
    'name': 'Ivan',
    'surname': 'Ivanov',
    'email': 'user@gmail.com',
    'image': 'assets/images/1.png',
  },
];