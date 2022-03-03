import 'package:flutter/material.dart';

import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_extra_fields/form_builder_extra_fields.dart';
// import 'package:intl/date_symbol_data_file.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:urp/app_router.gr.dart';

void main() async {
  await initializeDateFormatting();
  runApp(const MyApp());
}

final AppRouter appRouter = AppRouter();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        routeInformationParser: appRouter.defaultRouteParser(),
        routerDelegate: appRouter.delegate(),
        theme: ThemeData(primaryColor: Colors.green),
        builder: (context, widget) => ResponsiveWrapper.builder(
              ClampingScrollWrapper.builder(context, widget!),
              maxWidth: 800,
              minWidth: 480,
              defaultScale: true,
              breakpoints: [
                const ResponsiveBreakpoint.autoScale(480, name: MOBILE),
                const ResponsiveBreakpoint.autoScale(800,
                    scaleFactor: 2, name: TABLET),
              ],
              background: Container(
                color: Colors.grey.shade200,
              ),
            ));
  }
}

class FormBuilderExtra extends StatelessWidget {
  FormBuilderExtra({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormBuilderState>();
  final continents = [
    'Africa',
    'Asia',
    'Australia',
    'Europe',
    'North America',
    'South America'
  ];

  InputDecoration getDeco(String label) {
    return InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5), gapPadding: 10));
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      // autovalidate: true,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            FormBuilderSearchableDropdown(
              name: 'searchable_dropdown',
              items: continents,
              decoration: getDeco('Searchable Dropdown'),
            ),
            const SizedBox(height: 15),
            FormBuilderColorPickerField(
              name: 'color_picker',
              initialValue: Colors.yellow,
              // readOnly: true,
              colorPickerType: ColorPickerType.materialPicker,
              decoration: getDeco('Color Picker'),
            ),
            const SizedBox(height: 15),
            FormBuilderCupertinoDateTimePicker(
              name: 'date_time',
              initialValue: DateTime.now(),
              inputType: CupertinoDateTimePickerInputType.both,
              decoration: getDeco('Cupertino DateTime Picker'),
              locale: const Locale.fromSubtags(languageCode: 'en_GB'),
            ),
            const SizedBox(height: 15),
            FormBuilderCupertinoDateTimePicker(
              name: 'date',
              initialValue: DateTime.now(),
              inputType: CupertinoDateTimePickerInputType.date,
              decoration: getDeco('Cupertino DateTime Picker - Date Only'),
              locale: const Locale.fromSubtags(languageCode: 'en_GB'),
            ),
            const SizedBox(height: 15),
            FormBuilderCupertinoDateTimePicker(
              name: 'time',
              initialValue: DateTime.now(),
              inputType: CupertinoDateTimePickerInputType.time,
              decoration: getDeco('Cupertino DateTime Picker - Time Only'),
              locale: const Locale.fromSubtags(languageCode: 'en_GB'),
            ),
            const SizedBox(height: 15),
            FormBuilderTypeAhead<String>(
              decoration: const InputDecoration(
                  labelText: 'TypeAhead (Autocomplete TextField)',
                  hintText: 'Start typing continent name'),
              name: 'continent',
              itemBuilder: (context, continent) {
                return ListTile(title: Text(continent));
              },
              suggestionsCallback: (query) {
                if (query.isNotEmpty) {
                  var lowercaseQuery = query.toLowerCase();
                  return continents.where((continent) {
                    return continent.toLowerCase().contains(lowercaseQuery);
                  }).toList(growable: false)
                    ..sort((a, b) => a
                        .toLowerCase()
                        .indexOf(lowercaseQuery)
                        .compareTo(b.toLowerCase().indexOf(lowercaseQuery)));
                } else {
                  return continents;
                }
              },
            ),
            const SizedBox(height: 15),
            FormBuilderTouchSpin(
              decoration: getDeco('Touch Spin'),
              name: 'touch_spin',
              initialValue: 10,
              step: 1,
              iconSize: 48.0,
              addIcon: const Icon(Icons.arrow_right),
              subtractIcon: const Icon(Icons.arrow_left),
            ),
            const SizedBox(height: 15),
            FormBuilderRatingBar(
              decoration: getDeco('Ratings'),
              name: 'rate',

              // iconSize: 32.0,
              initialValue: 1.0,
              maxRating: 5.0,
              // max: 5.0,
            ),
            const SizedBox(height: 15),
            FormBuilderSignaturePad(
              decoration: getDeco('Signature Pad'),
              name: 'signature',
              border: Border.all(color: Colors.green),
            ),
            const SizedBox(height: 10),
            Row(
              children: <Widget>[
                Expanded(
                  child: MaterialButton(
                    color: Theme.of(context).colorScheme.secondary,
                    child: const Text(
                      "Submit",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      _formKey.currentState!.save();
                      if (_formKey.currentState!.validate()) {
                        print(_formKey.currentState!.value);
                      } else {
                        print("validation failed");
                      }
                    },
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: MaterialButton(
                    color: Theme.of(context).colorScheme.secondary,
                    child: const Text(
                      "Reset",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      _formKey.currentState!.reset();
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
