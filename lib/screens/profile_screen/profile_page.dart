import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

import 'package:flutter_test_pj/global/custom_widgets/app_bars/main_app_bar.dart';
import 'package:flutter_test_pj/global/custom_widgets/buttons/custom_text_button.dart';
import 'package:flutter_test_pj/models/user_api/user_from_database.dart';
import 'package:flutter_test_pj/models/user_api/user_to_database.dart';
import 'package:flutter_test_pj/screens/auth_screen/sing_in_widget/main_enter_screen.dart';
import 'package:flutter_test_pj/screens/profile_screen/api/user_data_api.dart';
import 'package:flutter_test_pj/screens/profile_screen/custom_widget/avatar.dart';
import 'package:flutter_test_pj/screens/profile_screen/custom_widget/user_expansion_tile.dart';
import 'package:flutter_test_pj/screens/profile_screen/custom_widget/user_textfield.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    UserDataApi.getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    UserFromDatabase userData = UserFromDatabase();
    return Scaffold(
      appBar: MainAppBar(
        title: 'Личный кабинет',
        backgroundcolor: Colors.grey[200],
        onTap: () => Navigator.pop(context),
        onPress: () => showDialog(
          context: context,
          child: AlertDialog(
            backgroundColor: Colors.black,
            title: Text(
              'Вы действительно хотите выйти?',
              style: TextStyle(color: Colors.white),
            ),
            content: CustomText(
              text: 'Да',
              color: Colors.blue,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    FirebaseAuth.instance.signOut();
                    return EnterScreen();
                  },
                ),
              ),
            ),
          ),
        ),
      ),
      body: FutureBuilder<UserFromDatabase>(
          future: UserDataApi.getData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Row(
                          children: [
                            Avatar(),
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 10),
                                      child: Text(
                                        '${snapshot.data.name ?? ''} ${snapshot.data.surname ?? ''}',
                                        style: TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                    Text('${snapshot.data.email ?? ''}'),
                                  ]),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                      ),
                      UserExpansionTile(
                        title: 'Мои контакты',
                        children: [
                          UserTextField(
                            title: 'Имя',
                            hintText: snapshot.data.name ?? 'Имя',
                            onSubmitted: (value) {
                              UserDataApi.uploadData(name: value);
                              setState(() {});
                            },
                          ),
                          UserTextField(
                            title: 'Фамилия',
                            hintText: snapshot.data.surname ?? 'Фамилия',
                            onSubmitted: (value) {
                              UserDataApi.uploadData(surname: value);
                              setState(() {});
                            },
                          ),
                          UserTextField(
                            readOnly: true,
                            title: 'Телефон',
                            hintText: snapshot.data.phone ?? 'Телефон',
                          ),
                          UserTextField(
                            title: 'Email',
                            hintText: snapshot.data.email ?? 'Email',
                            onSubmitted: (value) {
                              UserDataApi.uploadData(email: value);
                              setState(() {});
                            },
                          ),
                        ],
                      ),
                      UserExpansionTile(
                        title: 'Контакты Агента',
                        children: [
                          UserTextField(
                            title: 'Имя',
                          ),
                          UserTextField(
                            title: 'Фамилия',
                          ),
                          UserTextField(
                            title: 'Телефон',
                          ),
                          UserTextField(
                            title: 'Email',
                          ),
                        ],
                      ),
                      UserExpansionTile(
                        title: 'Управление подпиской',
                        children: [
                          Container(
                            height: 150,
                          )
                        ],
                      ),
                      UserExpansionTile(
                        title: 'Уведомления',
                        children: [
                          Container(
                            height: 150,
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 30),
                            child: SizedBox(
                              width: 200,
                              child: Text(
                                'Переключить звонки и сообщения на агента',
                                maxLines: 2,
                              ),
                            ),
                          ),
                          Switch(
                            value: false,
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 30),
                        child: CustomText(
                          text: 'Политика конфиденциальности',
                          color: Color.fromRGBO(28, 161, 152, 1),
                        ),
                      )
                    ],
                  ),
                ),
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
