import 'dart:math';

import 'package:faker/faker.dart';
import 'package:responsive_sizer/responsive_sizer.dart'as rp;
import '../../../routes/app_routes.dart';
import '../../../utils/drawer.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'search_page_model.dart';
export 'search_page_model.dart';

class SearchPageWidget extends StatefulWidget {
  const SearchPageWidget({Key? key}) : super(key: key);

  @override
  _SearchPageWidgetState createState() => _SearchPageWidgetState();
}

class _SearchPageWidgetState extends State<SearchPageWidget> {
  late SearchPageModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  List<Entry> entries = [];

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchPageModel());
    _generateEntries();
  }

  String _generateRandomSkills(List<String> technologySkills) {
    final List<String> selectedSkills = List.generate(
      Random().nextInt(technologySkills.length) + 1,
      (index) => technologySkills[Random().nextInt(technologySkills.length)],
    );

    return selectedSkills.join(', ');
  }

  void _generateEntries() {
    final faker = Faker();
    final List<String> technologySkills = [
      'Flutter',
      'Dart',
      'Node.js',
      'React',
      'Angular',
      'Vue.js',
      'Python',
      'Java',
      'Swift',
      'Kotlin',
      'Ruby',
      'C#'
    ];
    for (int i = 0; i < 50; i++) {
      entries.add(
        Entry(
          name: faker.person.firstName(),
          skills: _generateRandomSkills(technologySkills),
          experience: '${Random().nextInt(10) + 1} years',
          salary: '${Random().nextInt(10) + 1}-${Random().nextInt(10) + 5} lpa',
        ),
      );
    }
  }

  void _searchCandidates() {
    // Implement logic to filter entries based on user input and selected filters
    final String searchText = _model.textController.text.toLowerCase();
    final String? experienceFilter = _model.dropDownValue1;
    final String? salaryFilter = _model.dropDownValue2;

    setState(() {
      entries = entries.where((entry) {
        return entry.skills.toLowerCase().contains(searchText) &&
            (experienceFilter == null || entry.experience.contains(experienceFilter)) &&
            (salaryFilter == null || entry.salary.contains(salaryFilter));
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
   
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        drawer: WebViewAware(
            child: Drawer(
          elevation: 16.0,
          child: DrawerWidget(scaffoldKey: scaffoldKey,)
        )),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(40.0),
          child: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).secondary,
            automaticallyImplyLeading: false,
            leading: Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 48.0,
                icon: Icon(
                  Icons.menu_outlined,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 30.0,
                ),
                onPressed: () async {
                  scaffoldKey.currentState!.openDrawer();
                },
              ),
            ),
            title: Align(
              alignment: AlignmentDirectional(0.0, 1.0),
              child: Text(
                'Search Candidate',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Dhurjati',
                      color: FlutterFlowTheme.of(context).primaryText,
                      fontSize: 30.0,
                    ),
              ),
            ),
            actions: [],
            centerTitle: true,
            toolbarHeight: 30.0,
            elevation: 2.0,
          ),
        ),
        body: SingleChildScrollView(
          
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
               rp.Device.screenType!= rp.ScreenType.mobile?Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: 1.0,
                    height: 55.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                      child: TextFormField(
                        controller: _model.textController,
                        focusNode: _model.textFieldFocusNode,
                        autofocus: true,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'Enter the skills to search candidate',
                          labelStyle: FlutterFlowTheme.of(context).labelMedium,
                          hintStyle: FlutterFlowTheme.of(context).labelMedium,
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).alternate,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primary,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          errorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedErrorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium,
                        validator:
                            _model.textControllerValidator.asValidator(context),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () {
                        onPressed: _searchCandidates;
                      },
                      text: 'Button',
                      options: FFButtonOptions(
                        height: 40.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                                ),
                        elevation: 3.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ],
              ):Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: 1.0,
                    height: 55.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                      child: TextFormField(
                        controller: _model.textController,
                        focusNode: _model.textFieldFocusNode,
                        autofocus: true,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'Enter the skills to search candidate',
                          labelStyle: FlutterFlowTheme.of(context).labelMedium,
                          hintStyle: FlutterFlowTheme.of(context).labelMedium,
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).alternate,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primary,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          errorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedErrorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium,
                        validator:
                            _model.textControllerValidator.asValidator(context),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () {
                        onPressed: _searchCandidates;
                      },
                      text: 'Button',
                      options: FFButtonOptions(
                        height: 40.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                                ),
                        elevation: 3.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ],
              ),
              rp.Device.screenType != rp.ScreenType.mobile?Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  FlutterFlowDropDown<String>(
                    controller: _model.dropDownValueController1 ??=
                        FormFieldController<String>(
                      _model.dropDownValue1 ??= 'Fresher',
                    ),
                    options: [
                      'Fresher',
                      '6 months+',
                      '1 year+',
                      '2 years+',
                      '3 years+',
                      '4 years+',
                      '5 years+',
                      '6 years+',
                      '7 years+',
                      '8 years+',
                      '9 years+',
                      '10 years+'
                    ],
                    onChanged: (val) =>
                        setState(() => _model.dropDownValue1 = val),
                    width: 300.0,
                    height: 50.0,
                    textStyle: FlutterFlowTheme.of(context).bodyMedium,
                    hintText: 'Years of experience',
                    icon: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 24.0,
                    ),
                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                    elevation: 2.0,
                    borderColor: FlutterFlowTheme.of(context).alternate,
                    borderWidth: 2.0,
                    borderRadius: 8.0,
                    margin:
                        EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                    hidesUnderline: true,
                    isOverButton: true,
                    isSearchable: false,
                    isMultiSelect: false,
                  ),
                  FlutterFlowDropDown<String>(
                    controller: _model.dropDownValueController2 ??=
                        FormFieldController<String>(
                      _model.dropDownValue2 ??= '3-5 lpa',
                    ),
                    options: [
                      '3-5 lpa',
                      '5-8 lpa',
                      '9-12 lpa',
                      '13-15 lpa',
                      '15 lpa+'
                    ],
                    onChanged: (val) =>
                        setState(() => _model.dropDownValue2 = val),
                    width: 300.0,
                    height: 50.0,
                    textStyle: FlutterFlowTheme.of(context).bodyMedium,
                    hintText: 'Min salary expectation',
                    icon: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 24.0,
                    ),
                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                    elevation: 2.0,
                    borderColor: FlutterFlowTheme.of(context).alternate,
                    borderWidth: 2.0,
                    borderRadius: 8.0,
                    margin:
                        EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                    hidesUnderline: true,
                    isOverButton: true,
                    isSearchable: false,
                    isMultiSelect: false,
                  ),
                 
                ],
              ):Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  FlutterFlowDropDown<String>(
                    controller: _model.dropDownValueController1 ??=
                        FormFieldController<String>(
                      _model.dropDownValue1 ??= 'Fresher',
                    ),
                    options: [
                      'Fresher',
                      '6 months+',
                      '1 year+',
                      '2 years+',
                      '3 years+',
                      '4 years+',
                      '5 years+',
                      '6 years+',
                      '7 years+',
                      '8 years+',
                      '9 years+',
                      '10 years+'
                    ],
                    onChanged: (val) =>
                        setState(() => _model.dropDownValue1 = val),
                    width: 300.0,
                    height: 50.0,
                    textStyle: FlutterFlowTheme.of(context).bodyMedium,
                    hintText: 'Years of experience',
                    icon: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 24.0,
                    ),
                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                    elevation: 2.0,
                    borderColor: FlutterFlowTheme.of(context).alternate,
                    borderWidth: 2.0,
                    borderRadius: 8.0,
                    margin:
                        EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                    hidesUnderline: true,
                    isOverButton: true,
                    isSearchable: false,
                    isMultiSelect: false,
                  ),
                  FlutterFlowDropDown<String>(
                    controller: _model.dropDownValueController2 ??=
                        FormFieldController<String>(
                      _model.dropDownValue2 ??= '3-5 lpa',
                    ),
                    options: [
                      '3-5 lpa',
                      '5-8 lpa',
                      '9-12 lpa',
                      '13-15 lpa',
                      '15 lpa+'
                    ],
                    onChanged: (val) =>
                        setState(() => _model.dropDownValue2 = val),
                    width: 300.0,
                    height: 50.0,
                    textStyle: FlutterFlowTheme.of(context).bodyMedium,
                    hintText: 'Min salary expectation',
                    icon: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 24.0,
                    ),
                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                    elevation: 2.0,
                    borderColor: FlutterFlowTheme.of(context).alternate,
                    borderWidth: 2.0,
                    borderRadius: 8.0,
                    margin:
                        EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                    hidesUnderline: true,
                    isOverButton: true,
                    isSearchable: false,
                    isMultiSelect: false,
                  ),
                 
                ],
              ),
             Padding(
      padding: EdgeInsetsDirectional.fromSTEB(100.0, 0.0, 100.0, 0.0),
      child: ListView(
        key: ValueKey(random_data.randomInteger(0, 10).toString()),
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        children: entries.map((entry) => _buildEntryCard(entry)).toList(),
      ),
    ),
            ],
          ),
        ),
      ),
    );
  }

 Widget _buildEntryCard(Entry entry) {
    return Card(
      // Customize the appearance of the entry card as needed
      child: ListTile(
        title: Text(entry.name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Skills: ${entry.skills}'),
            Text('Experience: ${entry.experience}'),
            Text('Salary: ${entry.salary}'),
          ],
        ),
      ),
    );
  }
}

class Entry {
  final String name;
  final String skills;
  final String experience;
  final String salary;

  Entry({
    required this.name,
    required this.skills,
    required this.experience,
    required this.salary,
  });
}