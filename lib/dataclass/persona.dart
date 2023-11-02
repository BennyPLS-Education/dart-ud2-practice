/// Model for representing a `Persona`.
class Persona {
  String name;
  String surname;
  String password;
  String email;
  DateTime bornDate;

  /// Constructor
  Persona(this.name, this.surname, this.password, this.email, this.bornDate);

  /// Empty Constructor.
  Persona.empty() : this('', '', '', '', DateTime.now());

  /// The initials of the name and surname.
  /// If empty, it returns 'Guest'.
  get initials {
    if (name.isEmpty && surname.isEmpty) {
      return 'Guest';
    }

    var nameInitial = name.isNotEmpty ? name[0] : '';
    var lastNameInitial = surname.isNotEmpty ? surname[0] : '';

    return '$nameInitial$lastNameInitial'.toUpperCase();
  }
}
