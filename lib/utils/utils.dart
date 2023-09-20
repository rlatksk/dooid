// Function to validate a string based on provided criteria.
String? uValidator({
      required String value, 
      bool isRequired = false, 
      bool isEmail = false,
      int? minLength,
      String? match,
}) {
  if (isRequired) {
    if (value.isEmpty) {
      return 'Required';
    }
  }

  if(isEmail){
    if(!value.contains('@') || !value.contains('.')){
      return 'Invalid Email';
    }
  }

  if(minLength != null){
    if(value.length < minLength){
      return 'Minimum $minLength character';
    }
  }

  if(match != null){
    if(value != match){
      return 'Not Match';
    }
  }

  return null;
}
