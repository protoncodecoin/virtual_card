class ContactModel {
  int id;
  String name;
  String mobile;
  String address;
  String company;
  String designation;
  String website;
  String image;
  String email;
  bool favorite;

  ContactModel({
    required this.name,
    required this.mobile,
    this.id = -1,
    this.address = "",
    this.company = "",
    this.designation = "",
    this.website = "",
    this.image = "",
    this.favorite = false,
    this.email = '',
  });
}
