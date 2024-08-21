// ignore_for_file: camel_case_types
import 'package:goscore/stringfile.dart';
import 'package:goscore/theme/thememanager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class help extends StatefulWidget {
  const help({Key? key}) : super(key: key);

  @override
  State<help> createState() => _helpState();
}

class Step {
  Step(this.title, this.body, [this.isExpanded = false]);
  String title;
  String body;
  bool isExpanded;
}

List<Step> getSteps() {
  return [
    Step('Step 1: Install Flutter',
        'Install Flutter development tools according to the official documentation.'),
    Step('Step 2: Create a project',
        'Open your terminal, run `flutter create <project_name>` to create a new project.'),
    Step('Step 3: Run the app',
        'Change your terminal directory to the project directory, enter `flutter run`.'),
    Step('Step 4: Install Flutter',
        'Install Flutter development tools according to the official documentation.'),
    Step('Step 5: Create a project',
        'Open your terminal, run `flutter create <project_name>` to create a new project.'),
    Step('Step 6: Run the app',
        'Change your terminal directory to the project directory, enter `flutter run`.'),
  ];
}

class _helpState extends State<help> {
  final List<Step> _steps = getSteps();
  late ColorNotifire notifire;

  getdarkmodepreviousstate() async {
    final prefs = await SharedPreferences.getInstance();
    bool? previusstate = prefs.getBool("setIsDark");
    if (previusstate == null) {
      notifire.setIsDark = false;
    } else {
      notifire.setIsDark = previusstate;
    }
  }

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: notifire.backgroundallscreencolor,
        leadingWidth: MediaQuery.of(context).size.width * 0.2,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Image.asset(
            'assets/Menu2.png',
            scale: 2,
            color: notifire.textcolor,
          ),
        ),
        centerTitle: true,
        title: Text(
          Apptext.HelpandSupport,
          style: TextStyle(
              color: notifire.textcolor,
              fontFamily: 'Poppins',
              fontSize: 18,
              fontWeight: FontWeight.w600),
        ),
      ),
      backgroundColor: notifire.backgroundallscreencolor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              TextField(
                style:
                    TextStyle(color: notifire.textcolor, fontFamily: 'Poppins'),
                decoration: InputDecoration(
                  prefixIcon: Image.asset(
                    'assets/Seacrh2.png',
                    scale: 2,
                  ),
                  hintText: Apptext.Search,
                  hintStyle: TextStyle(
                      color: notifire.greytextcolor,
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: notifire.bordercolor),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: notifire.bordercolor),
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Container(
                child: renderSteps(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget renderSteps() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _steps[index].isExpanded = !isExpanded;
        });
      },
      children: _steps.map<ExpansionPanel>((Step step) {
        return ExpansionPanel(
          backgroundColor: notifire.checkboxlistilecolor,
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              iconColor: notifire.textcolor,
              title: Text(
                step.title,
                style: TextStyle(
                    color: notifire.textcolor,
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
            );
          },
          body: ListTile(
            title: Text(
              step.body,
              style: TextStyle(
                  color: notifire.greytextcolor,
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
          ),
          isExpanded: step.isExpanded,
        );
      }).toList(),
    );
  }
}
