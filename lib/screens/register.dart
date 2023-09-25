import 'package:dooid/screens/login.dart';
import 'package:dooid/screens/onboarding.dart';
import 'package:dooid/screens/utils.dart';
import 'package:dooid/screens/widgets/register/register_widgets.dart';
import 'package:dooid/screens/widgets/register/register_widgets_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Register extends StatefulWidget {
  @override
  State<Register> createState() => _RegisterState();
}

class NationDropdown extends StatefulWidget {
  @override
  _NationDropdownState createState() => _NationDropdownState();
}

class _NationDropdownState extends State<NationDropdown> {
  String selectedNation = '🇮🇩 Indonesia'; // Default value

  List<Map<String, String>> nations = [
    {'name': '🇦🇺 Australia', 'code': '+61'},
    {'name': '🇦🇹 Austria', 'code': '+43'},
    {'name': '🇦🇿 Azerbaijan', 'code': '+994'},
    {'name': '🇧🇭 Bahrain', 'code': '+973'},
    {'name': '🇧🇩 Bangladesh', 'code': '+880'},
    {'name': '🇧🇾 Belarus', 'code': '+375'},
    {'name': '🇧🇪 Belgium', 'code': '+32'},
    {'name': '🇧🇯 Benin', 'code': '+229'},
    {'name': '🇧🇹 Bhutan', 'code': '+975'},
    {'name': '🇧🇴 Bolivia', 'code': '+591'},
    {'name': '🇧🇦 Bosnia and Herzegovina', 'code': '+387'},
    {'name': '🇧🇼 Botswana', 'code': '+267'},
    {'name': '🇧🇷 Brazil', 'code': '+55'},
    {'name': '🇧🇬 Bulgaria', 'code': '+359'},
    {'name': '🇧🇫 Burkina Faso', 'code': '+226'},
    {'name': '🇧🇮 Burundi', 'code': '+257'},
    {'name': '🇰🇭 Cambodia', 'code': '+855'},
    {'name': '🇨🇲 Cameroon', 'code': '+237'},
    {'name': '🇨🇦 Canada', 'code': '+1'},
    {'name': '🇨🇫 Central African Republic', 'code': '+236'},
    {'name': '🇹🇩 Chad', 'code': '+235'},
    {'name': '🇨🇱 Chile', 'code': '+56'},
    {'name': '🇨🇳 China', 'code': '+86'},
    {'name': '🇨🇴 Colombia', 'code': '+57'},
    {'name': '🇨🇬 Congo', 'code': '+242'},
    {'name': '🇨🇷 Costa Rica', 'code': '+506'},
    {'name': '🇭🇷 Croatia', 'code': '+385'},
    {'name': '🇨🇺 Cuba', 'code': '+53'},
    {'name': '🇨🇾 Cyprus', 'code': '+357'},
    {'name': '🇨🇿 Czech Republic', 'code': '+420'},
    {'name': '🇩🇰 Denmark', 'code': '+45'},
    {'name': '🇩🇯 Djibouti', 'code': '+253'},
    {'name': '🇩🇴 Dominican Republic', 'code': '+1'},
    {'name': '🇪🇨 Ecuador', 'code': '+593'},
    {'name': '🇪🇬 Egypt', 'code': '+20'},
    {'name': '🇸🇻 El Salvador', 'code': '+503'},
    {'name': '🇪🇪 Estonia', 'code': '+372'},
    {'name': '🇪🇹 Ethiopia', 'code': '+251'},
    {'name': '🇫🇯 Fiji', 'code': '+679'},
    {'name': '🇫🇮 Finland', 'code': '+358'},
    {'name': '🇫🇷 France', 'code': '+33'},
    {'name': '🇬🇦 Gabon', 'code': '+241'},
    {'name': '🇬🇲 Gambia', 'code': '+220'},
    {'name': '🇬🇪 Georgia', 'code': '+995'},
    {'name': '🇩🇪 Germany', 'code': '+49'},
    {'name': '🇬🇭 Ghana', 'code': '+233'},
    {'name': '🇬🇷 Greece', 'code': '+30'},
    {'name': '🇬🇹 Guatemala', 'code': '+502'},
    {'name': '🇬🇼 Guinea-Bissau', 'code': '+245'},
    {'name': '🇬🇳 Guinea', 'code': '+224'},
    {'name': '🇭🇹 Haiti', 'code': '+509'},
    {'name': '🇭🇳 Honduras', 'code': '+504'},
    {'name': '🇭🇺 Hungary', 'code': '+36'},
    {'name': '🇮🇸 Iceland', 'code': '+354'},
    {'name': '🇮🇳 India', 'code': '+91'},
    {'name': '🇮🇩 Indonesia', 'code': '+62'},
    {'name': '🇮🇷 Iran', 'code': '+98'},
    {'name': '🇮🇶 Iraq', 'code': '+964'},
    {'name': '🇮🇪 Ireland', 'code': '+353'},
    {'name': '🇮🇱 Israel', 'code': '+972'},
    {'name': '🇮🇹 Italy', 'code': '+39'},
    {'name': '🇨🇮 Ivory Coast', 'code': '+225'},
    {'name': '🇯🇲 Jamaica', 'code': '+1'},
    {'name': '🇯🇵 Japan', 'code': '+81'},
    {'name': '🇯🇴 Jordan', 'code': '+962'},
    {'name': '🇰🇿 Kazakhstan', 'code': '+7'},
    {'name': '🇰🇪 Kenya', 'code': '+254'},
    {'name': '🇰🇮 Kiribati', 'code': '+686'},
    {'name': '🇽🇰 Kosovo', 'code': '+383'},
    {'name': '🇰🇼 Kuwait', 'code': '+965'},
    {'name': '🇰🇬 Kyrgyzstan', 'code': '+996'},
    {'name': '🇱🇦 Laos', 'code': '+856'},
    {'name': '🇱🇻 Latvia', 'code': '+371'},
    {'name': '🇱🇧 Lebanon', 'code': '+961'},
    {'name': '🇱🇸 Lesotho', 'code': '+266'},
    {'name': '🇱🇷 Liberia', 'code': '+231'},
    {'name': '🇱🇾 Libya', 'code': '+218'},
    {'name': '🇱🇮 Liechtenstein', 'code': '+423'},
    {'name': '🇱🇹 Lithuania', 'code': '+370'},
    {'name': '🇱🇺 Luxembourg', 'code': '+352'},
    {'name': '🇲🇰 North Macedonia', 'code': '+389'},
    {'name': '🇲🇬 Madagascar', 'code': '+261'},
    {'name': '🇲🇼 Malawi', 'code': '+265'},
    {'name': '🇲🇾 Malaysia', 'code': '+60'},
    {'name': '🇲🇻 Maldives', 'code': '+960'},
    {'name': '🇲🇱 Mali', 'code': '+223'},
    {'name': '🇲🇹 Malta', 'code': '+356'},
    {'name': '🇲🇷 Mauritania', 'code': '+222'},
    {'name': '🇲🇺 Mauritius', 'code': '+230'},
    {'name': '🇲🇽 Mexico', 'code': '+52'},
    {'name': '🇲🇩 Moldova', 'code': '+373'},
    {'name': '🇲🇳 Mongolia', 'code': '+976'},
    {'name': '🇲🇪 Montenegro', 'code': '+382'},
    {'name': '🇲🇦 Morocco', 'code': '+212'},
    {'name': '🇲🇿 Mozambique', 'code': '+258'},
    {'name': '🇲🇲 Myanmar', 'code': '+95'},
    {'name': '🇳🇦 Namibia', 'code': '+264'},
    {'name': '🇳🇵 Nepal', 'code': '+977'},
    {'name': '🇳🇱 Netherlands', 'code': '+31'},
    {'name': '🇳🇿 New Zealand', 'code': '+64'},
    {'name': '🇳🇮 Nicaragua', 'code': '+505'},
    {'name': '🇳🇪 Niger', 'code': '+227'},
    {'name': '🇳🇬 Nigeria', 'code': '+234'},
    {'name': '🇰🇵 North Korea', 'code': '+850'},
    {'name': '🇳🇴 Norway', 'code': '+47'},
    {'name': '🇴🇲 Oman', 'code': '+968'},
    {'name': '🇵🇰 Pakistan', 'code': '+92'},
    {'name': '🇵🇸 Palestine', 'code': '+970'},
    {'name': '🇵🇦 Panama', 'code': '+507'},
    {'name': '🇵🇬 Papua New Guinea', 'code': '+675'},
    {'name': '🇵🇾 Paraguay', 'code': '+595'},
    {'name': '🇵🇪 Peru', 'code': '+51'},
    {'name': '🇵🇭 Philippines', 'code': '+63'},
    {'name': '🇵🇱 Poland', 'code': '+48'},
    {'name': '🇵🇹 Portugal', 'code': '+351'},
    {'name': '🇶🇦 Qatar', 'code': '+974'},
    {'name': '🇷🇴 Romania', 'code': '+40'},
    {'name': '🇷🇺 Russia', 'code': '+7'},
    {'name': '🇷🇼 Rwanda', 'code': '+250'},
    {'name': '🇼🇸 Samoa', 'code': '+685'},
    {'name': '🇸🇲 San Marino', 'code': '+378'},
    {'name': '🇸🇦 Saudi Arabia', 'code': '+966'},
    {'name': '🇸🇳 Senegal', 'code': '+221'},
    {'name': '🇷🇸 Serbia', 'code': '+381'},
    {'name': '🇸🇨 Seychelles', 'code': '+248'},
    {'name': '🇸🇱 Sierra Leone', 'code': '+232'},
    {'name': '🇸🇬 Singapore', 'code': '+65'},
    {'name': '🇸🇰 Slovakia', 'code': '+421'},
    {'name': '🇸🇮 Slovenia', 'code': '+386'},
    {'name': '🇸🇧 Solomon Islands', 'code': '+677'},
    {'name': '🇸🇴 Somalia', 'code': '+252'},
    {'name': '🇿🇦 South Africa', 'code': '+27'},
    {'name': '🇰🇷 South Korea', 'code': '+82'},
    {'name': '🇸🇸 South Sudan', 'code': '+211'},
    {'name': '🇪🇸 Spain', 'code': '+34'},
    {'name': '🇱🇰 Sri Lanka', 'code': '+94'},
    {'name': '🇸🇩 Sudan', 'code': '+249'},
    {'name': '🇸🇷 Suriname', 'code': '+597'},
    {'name': '🇸🇿 Eswatini', 'code': '+268'},
    {'name': '🇸🇪 Sweden', 'code': '+46'},
    {'name': '🇨🇭 Switzerland', 'code': '+41'},
    {'name': '🇸🇾 Syria', 'code': '+963'},
    {'name': '🇹🇼 Taiwan', 'code': '+886'},
    {'name': '🇹🇯 Tajikistan', 'code': '+992'},
    {'name': '🇹🇿 Tanzania', 'code': '+255'},
    {'name': '🇹🇭 Thailand', 'code': '+66'},
    {'name': '🇹🇬 Togo', 'code': '+228'},
    {'name': '🇹🇴 Tonga', 'code': '+676'},
    {'name': '🇹🇳 Tunisia', 'code': '+216'},
    {'name': '🇹🇷 Turkey', 'code': '+90'},
    {'name': '🇹🇲 Turkmenistan', 'code': '+993'},
    {'name': '🇺🇬 Uganda', 'code': '+256'},
    {'name': '🇺🇦 Ukraine', 'code': '+380'},
    {'name': '🇦🇪 United Arab Emirates', 'code': '+971'},
    {'name': '🇬🇧 United Kingdom', 'code': '+44'},
    {'name': '🇺🇸 United States', 'code': '+1'},
    {'name': '🇺🇾 Uruguay', 'code': '+598'},
    {'name': '🇺🇿 Uzbekistan', 'code': '+998'},
    {'name': '🇻🇪 Venezuela', 'code': '+58'},
    {'name': '🇻🇳 Vietnam', 'code': '+84'},
    {'name': '🇾🇪 Yemen', 'code': '+967'},
    {'name': '🇿🇲 Zambia', 'code': '+260'},
    {'name': '🇿🇼 Zimbabwe', 'code': '+263'},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      child: DropdownButtonFormField(
        value: selectedNation,
        onChanged: (String? newValue) {
          setState(() {
            selectedNation = newValue!;
          });
        },
        items:
            nations.map<DropdownMenuItem<String>>((Map<String, String> nation) {
          return DropdownMenuItem<String>(
            value: nation['name'],
            child:
                Container(child: Text('${nation['name']} (${nation['code']})')),
          );
        }).toList(),
        decoration: InputDecoration(
          filled: true,
          fillColor: Color(0xFFEDEDED), // Set your desired background color
          contentPadding: EdgeInsets.all(10),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}

class _RegisterState extends State<Register> {
  TextEditingController _phoneNumber = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _isLoading = false;

  Widget _inputPhoneNumber() {
    return Container(
      width: 320,
      child: Column(
        children: <Widget>[
          DecoratedBox(
            decoration: BoxDecoration(
              color: Color(0xFFEDEDED),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                controller: _phoneNumber,
                decoration: InputDecoration(
                  hintText: 'Phone Number',
                  border: InputBorder.none,
                ),
                validator: (val) =>
                    uValidator(value: val!, minLength: 12, isRequired: true),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
              ),
            ),
          ),
          SizedBox(
              height:
                  8), // Add some space between TextFormField and the hint text
          Text(
            'We will send a verification code to your number to confirm it’s you.',
            style: TextStyle(color: Colors.black, fontSize: 10),
          ),
        ],
      ),
    );
  }

  Widget _inputSubmit() {
    return wInputSubmit(
      context: context,
      title: 'Continue',
      onPressed: () {
        if (!_formKey.currentState!.validate()) return;
        setState(() => _isLoading = true);
        registerWithEmail(
            context: context,
            phoneNumber: _phoneNumber.text,
            );
      },
    );
  }

  Widget _textRegister() {
    return wTextLink(
        text: 'Already have an account?',
        title: 'Sign In',
        onTap: () => wPushReplaceTo(context, LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: _isLoading
          ? wAppLoading(context)
          : Scaffold(
              resizeToAvoidBottomInset: false,
              body: SafeArea(
                child: Stack(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/register_login/register_login_background.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 250,
                            ),
                            SizedBox(
                              height: 110,
                              child: Container(
                                width: 320,
                                child: wAuthTitle(
                                  title: 'Sign Up',
                                  subtitle:
                                      'Create your account and revolutionize your finances.',
                                ),
                              ),
                            ),
                            NationDropdown(),
                            SizedBox(
                              height: 20,
                            ),
                            _inputPhoneNumber(),
                            SizedBox(
                              height: 20,
                            ),
                            _inputSubmit(),
                            _textRegister(),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 20,
                      left: 0,
                      right: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            height: 10,
                            width: 100,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            margin: EdgeInsets.only(right: 10),
                            padding: EdgeInsets.all(10),
                          ),
                          Container(
                            height: 10,
                            width: 100,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            margin: EdgeInsets.only(right: 10),
                            padding: EdgeInsets.all(10),
                          ),
                          Container(
                            height: 10,
                            width: 100,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            padding: EdgeInsets.all(10),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }

    void registerWithEmail(
      {required BuildContext context,
      required String phoneNumber,
      }) async {
    
    print(phoneNumber);
    
    await Future.delayed(Duration(seconds: 2));
    wPushReplaceTo(context, OnboardingScreen());
  }


  // void _registerSementara() async {
  //   if (!_formKey.currentState!.validate()) return;
  //   print('Phone Number: ${_phoneNumber.text}');

  //   setState(() => _isLoading = true);

  //   await Future.delayed(Duration(seconds: 2));
  //   wPushReplaceTo(context, Login());

  //   showModalBottomSheet(
  //       isScrollControlled: true,
  //       backgroundColor: Colors.transparent,
  //       context: context,
  //       builder: (context) {
  //         return VerifyEmail();
  //       });
  // }
}