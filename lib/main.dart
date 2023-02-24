import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

const wordList = [
  // nouns
  "Apfel",
  "Auto",
  "Baum",
  "Bär",
  "Ball",
  "Blume",
  "Boot",
  "Buch",
  "Butter",
  "Brücke",
  "Bus",
  "Büroklammer",
  "Bleistift",
  "Brot",
  "Buntstift",
  "Dach",
  "Drache",
  "Dose",
  "Ei",
  "Eichhörnchen",
  "Eimer",
  "Einhorn",
  "Eis",
  "Elefant",
  "Ente",
  "Erde",
  "Fahrrad",
  "Feder",
  "Feuerwehr",
  "Fisch",
  "Flasche",
  "Flieger",
  "Flugzeug",
  "Frosch",
  "Fuchs",
  "Gabel",
  "Gans",
  "Garten",
  "Geburtstag",
  "Geld",
  "Geschenk",
  "Giraffe",
  "Glas",
  "Glocke",
  "Gorilla",
  "Gras",
  "Gummi",
  "Gurke",
  "Hai",
  "Halskette",
  "Hammer",
  "Hand",
  "Handtuch",
  "Hase",
  "Haus",
  "Heft",
  "Heuschrecke",
  "Himmel",
  "Hund",
  "Hut",
  "Igel",
  "Insekt",
  "Jacke",
  "Junge",
  "Käfer",
  "Kaktus",
  "Kamera",
  "Kaninchen",
  "Karte",
  "Käse",
  "Katze",
  "Keks",
  "Kino",
  "Kirche",
  "Kleid",
  "Kopf",
  "Korb",
  "Kran",
  "Krebs",
  "Krokodil",
  "Krone",
  "Kuchen",
  "Kuh",
  "Kürbis",
  "Lampe",
  "Laster",
  "Laterne",
  "Laub",
  "Lehrer",
  "Leiter",
  "Leopard",
  "Löwe",
  "Luftballon",
  "Mädchen",
  "Mäuse",
  "Maus",
  "Messer",
  "Milch",
  "Mond",
  "Motorrad",
  "Müll",
  "Mütze",
  "Nacht",
  "Nadel",
  "Nashorn",
  "Nase",
  "Nest",
  "Nudel",
  "Ohr",
  "Orange",
  "Palme",
  "Panda",
  "Papagei",
  "Papier",
  "Pfanne",
  "Pferd",
  "Pflanze",
  "Pilz",
  "Pinguin",
  "Pizza",
  "Plätzchen",
  "Polizei",
  "Post",
  "Puppe",
  "Regen",
  "Regenbogen",
  "Regenschirm",
  "Reh",
  "Reifen",
  "Reis",
  "Robbe",
  "Rock",
  "Rose",
  "Säge",
  "Salz",
  "Sand",
  "Schaf",
  "Schere",
  "Schiff",
  "Schlüssel",
  "Schmetterling",
  "Schnecke",
  "Schnee",
  "Schuh",
  "Schule",
  "Schwamm",
  "Schwanz",
  "Seehund",
  "Seestern",
  "Seife",
  "Seil",
  "Sessel",
  "Sonne",
  "Spaten",
  "Spinne",
  "Spielzeug",
  "Stern",
  "Stuhl",
  "Stift",
  "Suppe",
  "T-Shirt",
  "Tafel",
  "Tanne",
  "Tasse",
  "Tausendfüßler",
  "Teddybär",
  "Teich",
  "Teig",
  "Teppich",
  "Tiger",
  "Tinte",
  "Tisch",
  "Toilette",
  "Tomate",
  "Topf",
  "Traktor",
  "Treppe",
  "Trompete",
  "Truhe",
  "Tulpe",
  "Turm",
  "Uhr",
  "Umhang",
  "Unterhose",
  "U-Boot",
  "Uhu",
  "Uhrwerk",
  "Uniform",
  "Universum",
  "Utensilien",
  "Vase",
  "Vergnügungspark",
  "Verkehr",
  "Verpackung",
  "Vogel",
  "Vogelnest",
  "Vulkan",
  "Wagen",
  "Wald",
  "Wand",
  "Wanduhr",
  "Wanze",
  "Wasser",
  "Wassermelone",
  "Wasserfall",
  "Wasserski",
  "Wasserspender",
  "Wecker",
  "Weihnachtsbaum",
  "Weintrauben",
  "Werkzeug",
  "Werkzeugkasten",
  "Wetter",
  "Wind",
  "Windmühle",
  "Windrad",
  "Windstoß",
  "Winkel",
  "Wissenschaft",
  "Wolf",
  "Wolke",
  "Würfel",
  "Wurm",
  "Xylophon",
  "Yacht",
  "Yeti",
  "Zauberer",
  "Zebra",
  "Zecke",
  "Zeh",
  "Zeitung",
  "Zelt",
  "Ziel",
  "Zirkus",
  "Zitrone",
  "Zollstock",
  "Zoo",
  "Zucchini",
  "Zug",
  "Zunge",
  "Zwerg",
  "Zwiebel",
  // adjectives
  "bunt",
  "freundlich",
  "lustig",
  "mutig",
  "neugierig",
  "schnell",
  "stark",
  "schön",
  "fröhlich",
  "glücklich",
  "nett",
  "frisch",
  "sauber",
  "lecker",
  "klein",
  "groß",
  "schlau",
  "dick",
  "dünn",
  "jung",
  "alt",
  "weich",
  "hart",
  "sauer",
  "scharf",
  "müde",
  "faul",
  "wichtig",
  "seltsam",
  "lebendig",
  "gefährlich",
  "interessant",
  "süß",
  "witzig",
  "gesund",
  "sicher",
  "hilfreich",
  "ehrlich",
  "geduldig",
  "aktiv",
  "klug",
  "friedlich",
  "fantastisch",
  "gemütlich",
  "fleißig",
  "frech",
  "frisch",
  "gierig",
  "glänzend",
  "heimlich",
  "hoch",
  "klar",
  "knackig",
  "kreativ",
  "laut",
  "locker",
  "mächtig",
  "perfekt",
  "prächtig",
  "ruhig",
  "saftig",
  "scheu",
  "schnell",
  "schön",
  "schwer",
  "selbstbewusst",
  "sonnig",
  "sparsam",
  "stolz",
  "stürmisch",
  "tapfer",
  "unabhängig",
  "unbeschreiblich",
  "verrückt",
  "verschieden",
  "vollständig",
  "warm",
  "wild",
  "zufrieden",
  "zusammen",
  "zuvorkommend",
  "verträumt",
  "entspannt",
  "höflich",
  "tapfer",
  "geduldig",
  "lustig",
  "kreativ",
  "abenteuerlich",
  "sportlich",
  "freundlich",
  "hilfsbereit",
  "fröhlich",
  "tollpatschig",
  "liebevoll",
  "verantwortungsbewusst",
  "wissbegierig",
  "selbstlos",
  "glücklich",
  "sicher",
  "sensibel",
  "stark",
  "ruhig",
  // colors
  "rot",
  "blau",
  "grün",
  "gelb",
  "orange",
  "violett",
  "pink",
  "schwarz",
  "weiß",
  "braun",
  "grau",
  "türkis",
  "gold",
  "silber",
  "beige",
  "rosa",
  "hellblau",
  "dunkelblau",
  "hellgrün",
  "dunkelgrün",
  "hellgelb",
  "dunkelgelb",
  "hellbraun",
  "dunkelbraun",
  "cremefarben",
  "lavendel",
  "rotbraun",
  "olivgrün",
];

Future<void> main() async {
  // debugPaintSizeEnabled = true;
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wörter wiederholen',
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.system,
      home: const MyHomePage(title: 'Wörter wiederholen'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// input

class NumberOfWordsPicker extends StatefulWidget {
  final void Function(int) onNumberSelected;

  const NumberOfWordsPicker({Key? key, required this.onNumberSelected})
      : super(key: key);

  @override
  State<NumberOfWordsPicker> createState() => _NumberOfWordsPickerState();
}

class _NumberOfWordsPickerState extends State<NumberOfWordsPicker> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final myController = TextEditingController(text: "6");

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Anzahl Wörter: "),
        SizedBox(
          width: 100,
          child: TextFormField(
            key: _formKey,
            textAlign: TextAlign.center,
            controller: myController,
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            decoration: const InputDecoration(
              hintText: "Anzahl Wörter",
            ),
            onSaved: (value) {
              if (value != null) {
                widget.onNumberSelected(int.parse(value));
              }
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Bitte Anzahl der Wörter als Zahl eingeben.";
              }
              return null;
            },
          ),
        ),
        ElevatedButton(
            onPressed: () {
              try {
                final value = int.parse(myController.value.text);
                widget.onNumberSelected(value);
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text("Bitte Anzahl Wörter eingeben."),
                    action: SnackBarAction(
                      label: '6 Wörter',
                      onPressed: () {
                        myController.text = "6";
                      },
                    ),
                  ),
                );
              }
            },
            child: const Text("anwenden"))
      ],
    );
  }
}

class _MyHomePageState extends State<MyHomePage> {
  final _random = Random();
  int _numberOfWords = 6;
  final List<bool> _results = [];
  List<String> currentWords = [];

  @override
  void initState() {
    super.initState();
    _pickCurrentWords();
  }

  String _describeResults() {
    if (_results.isEmpty) {
      return "Noch keine Ergebnisse für $_numberOfWords Wörter.";
    } else {
      final successes = _results
          .map((success) => success ? 1 : 0)
          .reduce((value, element) => value + element);
      final percent =
          ((100.0 * successes) / _results.length).toStringAsFixed(1);
      return "$successes / ${_results.length} Versuche erfolgreich ($percent %) mit $_numberOfWords Wörtern.";
    }
  }

  void _numberOfWordsChanged(int numberOfWords) {
    if (_numberOfWords != numberOfWords) {
      setState(() {
        _results.clear();
      });
    }
    setState(() {
      _numberOfWords = numberOfWords;
    });
    _pickCurrentWords();
  }

  void _reportResult(bool success) {
    setState(() {
      _results.add(success);
    });
    _pickCurrentWords();
  }

  void _pickCurrentWords() {
    final numWordsToChose = min(wordList.length, _numberOfWords);
    var choice = <String>[];
    while (choice.length < numWordsToChose) {
      final pick = wordList.elementAt(_random.nextInt(wordList.length));
      if (choice.contains(pick)) {
        continue;
      } else {
        choice.add(pick);
      }
    }
    setState(() {
      currentWords = choice;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            NumberOfWordsPicker(onNumberSelected: _numberOfWordsChanged),
            Container(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: currentWords
                    .map(
                      (word) => Container(
                        padding: const EdgeInsets.all(10),
                        child: Text(word,
                            style: const TextStyle(
                              fontSize: 30,
                            )),
                      ),
                    )
                    .toList(),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 40),
              child: Column(children: <Widget>[
                Wrap(
                  children: _results
                      .map((success) =>
                          Icon(success ? Icons.check : Icons.block))
                      .toList(),
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  child: Center(
                    child: Text(_describeResults()),
                  ),
                ),
                // _results.reduce((value, element) => false))),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amber[900],
                        ),
                        child: const Text("falsch wiederholt"),
                        onPressed: () {
                          _reportResult(false);
                        },
                      ),
                      ElevatedButton(
                        onPressed: _pickCurrentWords,
                        child: const Text("neue Wörter"),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.teal[400],
                        ),
                        child: const Text("richtig wiederholt"),
                        onPressed: () {
                          _reportResult(true);
                        },
                      ),
                    ]),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
