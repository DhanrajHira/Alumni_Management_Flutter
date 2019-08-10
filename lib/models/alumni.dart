class Alumni {
  String aluid;
  String firstname;
  String lastname;
  String dob;
  String gender;
  String corradd;
  String offadd;
  String email;
  String mobile;
  String currcity;
  String currcomp;
  String desg;
  String sesto;
  String sesfrom;
  String branch;

  Alumni(
      {this.aluid,
      this.branch,
      this.corradd,
      this.currcity,
      this.currcomp,
      this.desg,
      this.dob,
      this.email,
      this.firstname,
      this.gender,
      this.lastname,
      this.mobile,
      this.offadd,
      this.sesfrom,
      this.sesto});

  Map<String, dynamic> toMap() {
    return {
      'Alu_ID': aluid,
      'First_name': firstname,
      'Last_name': lastname,
      'DOB': dob,
      'Gender': gender,
      'Correspondance_Address': corradd,
      'Office_Address': offadd,
      'EmailID': email,
      'Mobile_No': mobile,
      'Current_city': currcity,
      'Current_company': currcomp,
      'Designation': desg,
      'Session_from': sesfrom,
      'Session_to': sesto,
      'Branch': branch,
    };
  }

  factory Alumni.frommap(datamap) => Alumni(
      aluid: datamap['Alu_ID'].toString(),
      branch: datamap['Branch'],
      corradd: datamap['Correspondance_Address'],
      currcity: datamap['Current_city'],
      currcomp: datamap['Current_company'],
      desg: datamap['Designation'],
      dob: datamap['DOB'],
      sesfrom: datamap['Session_from'],
      sesto: datamap['Session_to'],
      email: datamap['EmailID'],
      firstname: datamap['First_name'],
      lastname: datamap['Last_name'],
      gender: datamap['Gender'],
      mobile: datamap['Mobile_No'],
      offadd: datamap['Office_Address']);

  static const List<String> fieldnames = [
    'Alu_ID',
    'First_name',
    'Last_name',
    'DOB',
    'Gender',
    'Correspondance_Address',
    'Office_Address',
    'EmailID',
    'Mobile_No',
    'Current_city',
    'Current_company',
    'Designation',
    'Session_from',
    'Session_to',
    'Branch'
  ];
}
