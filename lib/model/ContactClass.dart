class ContactClass{
  final String name;
  final String department;
  final String phone;
  final String des;
  final String email;


  const ContactClass({
    required this.name,
    required this.department,
    required this.phone,
    required this.des,
    required this.email

  });

  static ContactClass fromJson(json) => ContactClass(
      name: json['name'],
      department: json['department'],
      phone: json['phone'],
      des: json['des'],
      email: json['email']);
}