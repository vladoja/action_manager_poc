import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/widgets/widget_utils.dart';
import '../../../../domain/entities/oso/oso.dart';
import '../../../bloc/oso/oso/oso_bloc.dart';

class OsoEditFormWidget extends StatelessWidget {
  final OsoEntity? person;
  const OsoEditFormWidget({super.key, this.person});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final nameController = TextEditingController();
    final priezviskoController = TextEditingController();
    final pekController = TextEditingController();
    final titulController = TextEditingController();
    final bydliskoController = TextEditingController();
    final telefonController = TextEditingController();
    final datumNarodeniaController = TextEditingController();
    final miestoNarodeniaController = TextEditingController();
    final cisloPeciatkyController = TextEditingController();
    final platnostOsvedceniaDatumController = TextEditingController();
    return _buildForm(context, formKey,
        meno: nameController,
        priezvisko: priezviskoController,
        pek: pekController,
        titul: titulController,
        bydlisko: bydliskoController,
        telefon: telefonController,
        datumNarodenia: datumNarodeniaController,
        miestoNarodenia: miestoNarodeniaController,
        cisloPeciatky: cisloPeciatkyController,
        platnostOsvedceniaDatum: platnostOsvedceniaDatumController);
  }

  _buildForm(
    BuildContext context,
    GlobalKey<FormState> formKey, {
    required TextEditingController meno,
    required TextEditingController priezvisko,
    required TextEditingController titul,
    required TextEditingController pek,
    required TextEditingController bydlisko,
    required TextEditingController telefon,
    required TextEditingController datumNarodenia,
    required TextEditingController miestoNarodenia,
    required TextEditingController cisloPeciatky,
    required TextEditingController platnostOsvedceniaDatum,
  }) {
    return Scrollbar(
      child: SingleChildScrollView(
        primary: true,
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Form(
              key: formKey,
              child: Column(children: [
                buildFormTextField(meno, "Meno",
                    value: (person != null) ? person!.meno : null),
                const SizedBox(
                  height: 5,
                ),
                buildFormTextField(priezvisko, "Priezvisko",
                    value: (person != null) ? person!.priezvisko : null),
                const SizedBox(
                  height: 5,
                ),
                buildFormTextField(titul, "Titul",
                    value: (person != null) ? person!.titul : null),
                const SizedBox(
                  height: 10,
                ),
                buildFormTextField(pek, "PEK (Zamestnávateľ)",
                    value: (person != null) ? person!.pek : null),
                const SizedBox(
                  height: 10,
                ),
                buildFormTextField(cisloPeciatky, "Cislo peciatky",
                    value: (person != null) ? person!.cisloPeciatky : null),
                const SizedBox(
                  height: 10,
                ),
                buildFormTextField(
                    platnostOsvedceniaDatum, "Platnost Osvedcenia",
                    value: (person != null)
                        ? person!.platnostOsvedceniaDatum
                        : null),
                const SizedBox(
                  height: 10,
                ),
                buildFormTextField(bydlisko, "Bydlisko",
                    value: (person != null) ? person!.bydlisko : null),
                const SizedBox(
                  height: 10,
                ),
                buildFormTextField(telefon, "Telefon",
                    value: (person != null) ? person!.telefon : null),
                const SizedBox(
                  height: 10,
                ),
                buildFormTextField(datumNarodenia, "Datum narodenia",
                    value: (person != null) ? person!.datumNarodenia : null),
                const SizedBox(
                  height: 10,
                ),
                buildFormTextField(miestoNarodenia, "Miesto narodenia",
                    value: (person != null) ? person!.miestoNarodenia : null),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        debugPrint("Safely validated");
                        if (person == null) {
                          int id = DateTime.now().millisecondsSinceEpoch;
                          OsoEntity personNew = OsoEntity(
                            id: id,
                            meno: meno.text,
                            priezvisko: priezvisko.text,
                            titul: titul.text,
                            pek: pek.text,
                            bydlisko: bydlisko.text,
                            telefon: telefon.text,
                            datumNarodenia: datumNarodenia.text,
                            miestoNarodenia: miestoNarodenia.text,
                            cisloPeciatky: cisloPeciatky.text,
                            platnostOsvedceniaDatum:
                                platnostOsvedceniaDatum.text,
                          );
                          _onCreateButtonTapped(context, personNew);
                        } else {
                          OsoEntity personAfterEdit = OsoEntity(
                            id: person!.id,
                            meno: meno.text,
                            priezvisko: priezvisko.text,
                            titul: titul.text,
                            pek: pek.text,
                            bydlisko: bydlisko.text,
                            telefon: telefon.text,
                            datumNarodenia: datumNarodenia.text,
                            miestoNarodenia: miestoNarodenia.text,
                            cisloPeciatky: cisloPeciatky.text,
                            platnostOsvedceniaDatum:
                                platnostOsvedceniaDatum.text,
                          );
                          _onEditButtonTapped(context, personAfterEdit);
                        }
                        Navigator.of(context).pop();
                      }
                    },
                    child: const Text('Ulož')),
              ]),
            ),
          ],
        ),
      ),
    );
  }

  void _onCreateButtonTapped(BuildContext context, OsoEntity osoba) {
    BlocProvider.of<OsoBloc>(context).add(CreateOsoInOso(osoba));
    // BlocProvider.of<OsobyBloc>(context).add(CreateOsobaInOsoby(person));
  }

  void _onEditButtonTapped(BuildContext context, OsoEntity person) {
    // BlocProvider.of<OsobyBloc>(context).add(UpdateOsobaInOsoby(person));
  }
}
