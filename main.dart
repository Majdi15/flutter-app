import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ANALYSE VOYELLE',
      theme: ThemeData(
        primaryColor: Colors.blue,
   
        fontFamily: 'Roboto',
      ),
      home: WordAnalyzer(),
    );
  }
}

class WordAnalyzer extends StatefulWidget {
  @override
  _WordAnalyzerState createState() => _WordAnalyzerState();
}

class _WordAnalyzerState extends State<WordAnalyzer> {
  String inputWord = '';
  int vowelCount = 0;
  int consonantCount = 0;

  void analyzeWord(String word) {
    setState(() {
      vowelCount = 0;
      consonantCount = 0;
      for (int i = 0; i < word.length; i++) {
        if ('aeiouAEIOU'.contains(word[i])) {
          vowelCount++;
        } else if (word[i].trim().isNotEmpty) {
          consonantCount++;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ANALYSE VOYELLE'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              onChanged: (value) {
                setState(() {
                  inputWord = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Enter a word',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(2.0),
                ),
              ),
              style: TextStyle(fontFamily: 'Roboto'),
            ),
            SizedBox(height: 5.0),
            ElevatedButton(
              onPressed: () {
                analyzeWord(inputWord);
              },
              child: Text('Analyze'),
              style: ElevatedButton.styleFrom(
                textStyle: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                padding: EdgeInsets.symmetric(vertical: 16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Number of vowels: $vowelCount',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 18.0,
                color: Theme.of(context).primaryColor,
              ),
            ),
            Text(
              'Number of consonants: $consonantCount',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 18.0,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            inputWord = '';
            vowelCount = 0;
            consonantCount = 0;
          });
        },
        tooltip: 'Clear',
        child: Icon(Icons.clear),
      ),
    );
  }
}
