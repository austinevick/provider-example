import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UiSettings(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: ProviderDemo(),
      ),
    );
  }
}

class ProviderDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('State management with provider'),
      ),
      body: Consumer<UiSettings>(
        builder: (context, settings, child) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text('Bold font', style: settings.textStyle),
              Switch(
                  value: settings.boldFont,
                  onChanged: (value) {
                    settings.setBoldfont(value);
                  }),
              Text('Iorem ipsum', style: settings.textStyle),
              SizedBox(
                height: 20,
              ),
              Slider(
                  min: 12,
                  max: 30,
                  divisions: 10,
                  label: settings.fontSize.toStringAsFixed(2),
                  value: settings.fontSize,
                  onChanged: (v) {
                    settings.setFontSize(v);
                  }),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 100,
                width: 150,
                decoration: BoxDecoration(
                    color: settings.color,
                    borderRadius: BorderRadius.circular(settings.boxRadius)),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FlatButton(
                      color: Colors.pink,
                      onPressed: () {
                        settings.setColor(Colors.pink);
                      },
                      child: Text(
                        'Pink',
                        style: settings.textStyle,
                      )),
                  FlatButton(
                      color: Colors.yellow,
                      onPressed: () {
                        settings.setColor(Colors.yellow);
                      },
                      child: Text(
                        'Yellow',
                        style: settings.textStyle,
                      )),
                  FlatButton(
                      color: Colors.blue,
                      onPressed: () {
                        settings.setColor(Colors.blue);
                      },
                      child: Text(
                        'Blue',
                        style: settings.textStyle,
                      ))
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 100,
                width: 150,
                decoration: BoxDecoration(
                    color: settings.color,
                    borderRadius: BorderRadius.circular(
                      settings.boxRadius,
                    )),
              ),
              Slider(
                  min: 5,
                  max: 50,
                  divisions: 10,
                  label: settings.boxRadius.toStringAsFixed(0),
                  value: settings.boxRadius,
                  onChanged: (v) {
                    settings.setBoxRadius(v);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
