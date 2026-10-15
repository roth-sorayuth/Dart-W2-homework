enum Skill { FLUTTER, DART, OTHER }

class Employee {

  final String _name;

  final double _baseSalary;

  List<Skill> _skills = [];

  final Address _address;

  int _yearsOfExperience;

  Employee({required this._name, required this._baseSalary, required this._yearsOfExperience, required this._skills,required this._address});

  
  Employee.mobileDev({required this._name, required this._baseSalary, required this._yearsOfExperience, required this._address}) {
      this._skills = [Skill.DART, Skill.FLUTTER];
  }

  Employee.otherDev({required this._name, required this._baseSalary, required this._yearsOfExperience, required this._address}) {
      _skills = [Skill.OTHER];
  }


  String get name => _name;
  double get baseSalary => _baseSalary;
  List get skill => _skills;
  Address get address => _address;
  int get yearsOfExperience => _yearsOfExperience;


  double computeSalary(){

    double salary = 0;
    for(int i = 0; i < _skills.length; i++){
      switch (_skills[i]){
        case Skill.DART:
        salary += 100;
        break;
        case Skill.FLUTTER:
        salary += 200;
          break;
        case Skill.OTHER:
          salary += 5;
           break;
          
      }

    }

    return salary += (baseSalary) + (_yearsOfExperience * 10);
  }


  void printDetails() {
    print('Employee: $name, Base Salary: \$${baseSalary}');
  }
}

class Address{
  final String street;
  final String city;
  final String zipCode;

  Address(this.city, this.street, this.zipCode);
}

void main() {
  // var emp1 = Employee('Sokea', 40000);
  // emp1.printDetails();

  // var emp2 = Employee('Ronan', 45000);
  // emp2.printDetails();

 Address kandal = Address("PP", "598", "Zip zam");

 Employee e1 = Employee.mobileDev(name: "Yuth", baseSalary: 400, yearsOfExperience: 3, address:kandal);

 print(e1.computeSalary());


}