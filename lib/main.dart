import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:dropdownfield/dropdownfield.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "FormValidation",
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

// ==================  for allergies ========================================================================

class MultiSelectDialogItem<V> {
  const MultiSelectDialogItem(this.value, this.label);

  final V value;
  final String label;
}

class MultiSelectDialog<V> extends StatefulWidget {
  MultiSelectDialog({Key key, this.items, this.initialSelectedValues})
      : super(key: key);

  final List<MultiSelectDialogItem<V>> items;
  final Set<V> initialSelectedValues;

  @override
  State<StatefulWidget> createState() => _MultiSelectDialogState<V>();
}

class _MultiSelectDialogState<V> extends State<MultiSelectDialog<V>> {
  final _selectedValues = Set<V>();

  void initState() {
    super.initState();
    if (widget.initialSelectedValues != null) {
      _selectedValues.addAll(widget.initialSelectedValues);
    }
  }

  void _onItemCheckedChange(V itemValue, bool checked) {
    setState(() {
      if (checked) {
        _selectedValues.add(itemValue);
      } else {
        _selectedValues.remove(itemValue);
      }
    });
  }

  void _onCancelTap() {
    Navigator.pop(context);
  }

  void _onSubmitTap() {
    Navigator.pop(context, _selectedValues);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Select Allergies'),
      contentPadding: EdgeInsets.only(top: 12.0),
      content: SingleChildScrollView(
        child: ListTileTheme(
          contentPadding: EdgeInsets.fromLTRB(14.0, 0.0, 24.0, 0.0),
          child: ListBody(
            children: widget.items.map(_buildItem).toList(),
          ),
        ),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text('CANCEL'),
          onPressed: _onCancelTap,
        ),
        FlatButton(
          child: Text('OK'),
          onPressed: _onSubmitTap,
        )
      ],
    );
  }

  Widget _buildItem(MultiSelectDialogItem<V> item) {
    final checked = _selectedValues.contains(item.value);
    return CheckboxListTile(
      value: checked,
      title: Text(item.label),
      controlAffinity: ListTileControlAffinity.leading,
      onChanged: (checked) => _onItemCheckedChange(item.value, checked),
    );
  }
}

// ==================   end of line for allergies=============================================================

//====================  for co-morbidities====================================================================

class MultiSelectDialogItem1<V> {
  const MultiSelectDialogItem1(this.value, this.label);

  final V value;
  final String label;
}

class MultiSelectDialog1<V> extends StatefulWidget {
  MultiSelectDialog1({Key key, this.items, this.initialSelectedValues})
      : super(key: key);

  final List<MultiSelectDialogItem<V>> items;
  final Set<V> initialSelectedValues;

  @override
  State<StatefulWidget> createState() => _MultiSelectDialogState<V>();
}

class _MultiSelectDialogState1<V> extends State<MultiSelectDialog<V>> {
  final _selectedValues = Set<V>();

  void initState() {
    super.initState();
    if (widget.initialSelectedValues != null) {
      _selectedValues.addAll(widget.initialSelectedValues);
    }
  }

  void _onItemCheckedChange(V itemValue, bool checked) {
    setState(() {
      if (checked) {
        _selectedValues.add(itemValue);
      } else {
        _selectedValues.remove(itemValue);
      }
    });
  }

  void _onCancelTap() {
    Navigator.pop(context);
  }

  void _onSubmitTap() {
    Navigator.pop(context, _selectedValues);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Select Co-morbidities'),
      contentPadding: EdgeInsets.only(top: 12.0),
      content: SingleChildScrollView(
        child: ListTileTheme(
          contentPadding: EdgeInsets.fromLTRB(14.0, 0.0, 24.0, 0.0),
          child: ListBody(
            children: widget.items.map(_buildItem).toList(),
          ),
        ),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text('CANCEL'),
          onPressed: _onCancelTap,
        ),
        FlatButton(
          child: Text('OK'),
          onPressed: _onSubmitTap,
        )
      ],
    );
  }

  Widget _buildItem(MultiSelectDialogItem<V> item) {
    final checked = _selectedValues.contains(item.value);
    return CheckboxListTile(
      value: checked,
      title: Text(item.label),
      controlAffinity: ListTileControlAffinity.leading,
      onChanged: (checked) => _onItemCheckedChange(item.value, checked),
    );
  }
}
// ===================  end of line for co-morbidities=========================================================

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController dateCtl = TextEditingController();
  String contact = "";
  String pincode = "";
  //String email = "";
  String firstname = "";
  String formattedDate = "";
  String lastname = "";
  //String password = "";
  List<String> gender = ["Male", "Female", "Other"];
  List<String> blood = ["A+", "B+", "A-", "B-", "AB+", "AB-", "O+", "O-"];
  final bloodselected = TextEditingController();
  final genderselected = TextEditingController();
  String bloodselect = "";
  String genderselect = "";
  DateTime _dateTime = DateTime.now();
  String value = "";
  List<DropdownMenuItem<String>> menuitems = List();
  bool disabledropdown = true;
  final GlobalKey<FormState> _formKey = GlobalKey();

  void _submit() {
    // you can write your
    // own code according to
    // whatever you want to submit;
  }

  //for allergies list
  void getvaluefromkey(Set selection) {
    if (selection != null) {
      for (int x in selection.toList()) {
        print(valuestopopulate[x]);
      }
    }
  }

  //for co-morbidities list
  void getvaluefromkey1(Set selection) {
    if (selection != null) {
      for (int x in selection.toList()) {
        print(valuestopopulate[x]);
      }
    }
  }

  //for allergies list
  List<MultiSelectDialogItem<int>> multiItem = List();
  //for co-morbidities list
  List<MultiSelectDialogItem<int>> multiItem1 = List();

  //for allergies list
  final valuestopopulate = {
    1: "Drug Allergy",
    2: "Food Allergy",
    3: "Insect Allergy",
    4: "Latex Allergy",
  };
  //for co-morbidities list
  final valuestopopulate1 = {
    1: "Dyslipidemia.",
    2: "Essential hypertension",
    3: "Disorders of lipid metabolism",
    4: "Other forms of chronic ischemic heart disease",
  };

  //for allergies
  void populateMultiselect() {
    for (int v in valuestopopulate.keys) {
      multiItem.add(MultiSelectDialogItem(v, valuestopopulate[v]));
    }
  }

  //for co-morbidities
  void populateMultiselect1() {
    for (int v in valuestopopulate1.keys) {
      multiItem.add(MultiSelectDialogItem(v, valuestopopulate1[v]));
    }
  }

  //for allergies
  void _showMultiSelect(BuildContext context) async {
    multiItem = [];
    populateMultiselect();
    final items = multiItem;
    final selectedValues = await showDialog<Set<int>>(
      context: context,
      builder: (BuildContext context) {
        return MultiSelectDialog(
          items: items,
          //initialSelectedValues: [1,2].toSet(),
        );
      },
    );
    print(selectedValues);
    getvaluefromkey(selectedValues);
  }

  //for co-morbidities
  void _showMultiSelect1(BuildContext context) async {
    multiItem = [];
    populateMultiselect1();
    final items = multiItem;
    final selectedValues = await showDialog<Set<int>>(
      context: context,
      builder: (BuildContext context) {
        return MultiSelectDialog(
          items: items,
          //initialSelectedValues: [1,2].toSet(),
        );
      },
    );
    print(selectedValues);
    getvaluefromkey(selectedValues);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Swasthya App - Uday.V.More"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                      decoration: InputDecoration(
                          labelText: 'First Name',
                          border: OutlineInputBorder()),
                      keyboardType: TextInputType.name,
                      onFieldSubmitted: (value) {
                        setState(() {
                          firstname = value;
                        });
                      }),

                  TextFormField(
                    decoration: InputDecoration(labelText: 'Last Name'),
                    keyboardType: TextInputType.name,
                    onFieldSubmitted: (value) {
                      setState(() {
                        lastname = value;
                      });
                    },
                  ),
                  //String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(now);

                  DropDownField(
                    controller: genderselected,
                    hintText: "Select Gender",
                    enabled: true,
                    items: gender,
                    onValueChanged: (value) {
                      setState(() {
                        genderselect = value;
                      });
                    },
                  ),

                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Emergency Contact Number',
                        border: OutlineInputBorder()),
                    keyboardType: TextInputType.phone,
                    onFieldSubmitted: (value) {
                      setState(() {
                        contact = value;
                      });
                    },
                  ),

                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Pincode', border: OutlineInputBorder()),
                    keyboardType: TextInputType.number,
                    onFieldSubmitted: (value) {
                      setState(() {
                        pincode = value;
                      });
                    },
                  ),

                  //for allergies
                  RaisedButton(
                    child: Text("Select Allergies"),
                    onPressed: () => _showMultiSelect(context),
                  ),

                  //for co-morbidities
                  RaisedButton(
                    child: Text("Select Co-morbidities"),
                    onPressed: () => _showMultiSelect1(context),
                  ),

                  TextFormField(
                    controller: dateCtl,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Date of Birth',
                        hintText: 'Enter your Date of Birth'),
                    onTap: () async {
                      FocusScope.of(context).requestFocus(new FocusNode());
                      _dateTime = await showDatePicker(
                          context: null,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2100));
                      dateCtl.text = _dateTime.toString();
                      formattedDate =
                          DateFormat('yyyy-MM-dd – kk:mm').format(_dateTime);
                    },
                    onFieldSubmitted: (value) {
                      setState(() {
                        formattedDate = value;
                      });
                    },
                  ),

                  DropDownField(
                    controller: bloodselected,
                    hintText: "Select Blood Group",
                    enabled: true,
                    items: blood,
                    onValueChanged: (value) {
                      setState(() {
                        bloodselect = value;
                      });
                    },
                  ),
                  // this is where the
                  // input goes

                  RaisedButton(
                    onPressed: _submit,
                    child: Text("submit"),
                  ),
                ],
              ),
            ),
            // this is where
            // the form field
            // are defined
            SizedBox(
              height: 20,
            ),
            Column(
              children: <Widget>[
                firstname.isEmpty ? Text("No data") : Text(firstname),
                SizedBox(
                  height: 10,
                ),
                lastname.isEmpty ? Text("No Data") : Text(lastname),
                SizedBox(
                  height: 10,
                ),
                pincode.isEmpty ? Text("No Data") : Text(pincode),
                SizedBox(
                  height: 10,
                ),
                contact.isEmpty ? Text("No Data") : Text(contact),
                SizedBox(
                  height: 10,
                ),
                bloodselect.isEmpty ? Text("No Data") : Text(bloodselect),
                SizedBox(
                  height: 10,
                ),
                genderselect.isEmpty ? Text("No Data") : Text(genderselect),
                SizedBox(
                  height: 10,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
