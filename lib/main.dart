

import 'package:crypto_price_tracker/screens/contacts.dart';
import 'package:crypto_price_tracker/screens/dashboard.dart';
import 'package:crypto_price_tracker/screens/drw.dart';
import 'package:crypto_price_tracker/screens/events.dart';
import 'package:crypto_price_tracker/screens/feedback.dart';
import 'package:crypto_price_tracker/screens/notes.dart';
import 'package:crypto_price_tracker/screens/notify.dart';
import 'package:crypto_price_tracker/screens/privacy_policy.dart';
import 'package:crypto_price_tracker/screens/settings.dart';
import 'package:crypto_price_tracker/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import 'controller/coin_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),

    );
  }
}
class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
var currentPage = DrawerSections.dashboard;
  final CoinController controller = Get.put(CoinController());

  @override
  Widget build(BuildContext context) {
    var container;
    if(currentPage == DrawerSections.dashboard) {
      container = DashboardPage();
    } else if (currentPage == DrawerSections.contacts) {
      container = ContactsPage();
    } else if (currentPage == DrawerSections.events) {
      container = EventsPage();
    } else if (currentPage == DrawerSections.notes) {
      container = NotesPage();
    } else if (currentPage == DrawerSections.settings) {
      container = SettingsPage();
    } else if (currentPage == DrawerSections.notifications) {
      container = NotificationsPage();
    } else if (currentPage == DrawerSections.privacy_policy) {
      container = PrivacyPolicyPage();
    } else if (currentPage == DrawerSections.send_feedback) {
      container = SendFeedbackPage();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Crypto Price Tracker"),
      ),
      backgroundColor: Colors.black,
      // backgroundColor: Color(0xff494F55),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Column(
            children: [
              Text(
                "Crypto MArket",
                style: textStyle(25, Colors.white, FontWeight.bold),
              ),
              Obx(
                    () => controller.isLoading.value
                    ? const Center(
                  child: CircularProgressIndicator(),
                )
                    : ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 60,
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 60,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade700,
                                      borderRadius:
                                      BorderRadius.circular(15),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey.shade700,
                                            offset: const Offset(4, 4),
                                            blurRadius: 5)
                                      ],
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Image.network(
                                          controller.coinList[index].image),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Padding(
                                    padding:
                                    const EdgeInsets.only(top: 10.0),
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          controller.coinList[index].name,
                                          style: textStyle(18, Colors.white,
                                              FontWeight.w600),
                                        ),
                                        Text(
                                          "${controller.coinList[index].priceChangePercentage24H.toStringAsFixed(2)} %",
                                          style: textStyle(18, Colors.grey,
                                              FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 10.0, right: 20),
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      "\$ ${controller.coinList[index].currentPrice.round()}",
                                      style: textStyle(15, Colors.white,
                                          FontWeight.w600),
                                    ),
                                    Text(
                                      controller.coinList[index].symbol
                                          .toUpperCase(),
                                      style: textStyle(
                                          15, Colors.grey, FontWeight.w600),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: [MyHeader(), MyList()],
          ),
        ),
      ),
    );
  }

  Widget MyList() {
    return Container(
      padding: EdgeInsets.only(top: 15),
      child: Column(
        children: [
          menuItem(1, "Dashboard", Icons.dashboard_outlined,
              currentPage == DrawerSections.dashboard ? true : false),
          menuItem(2, "Contacts", Icons.people_alt_outlined,
              currentPage == DrawerSections.contacts ? true : false),
          menuItem(3, "Events", Icons.event,
              currentPage == DrawerSections.events ? true : false),
          menuItem(4, "Notes", Icons.notes,
              currentPage == DrawerSections.notes ? true : false),
          const Divider(),
          menuItem(5, "Settings", Icons.settings_outlined,
              currentPage == DrawerSections.settings ? true : false),
          menuItem(6, "Notifications", Icons.notifications_outlined,
              currentPage == DrawerSections.notifications ? true : false),
          const Divider(),
          menuItem(7, "Privacy policy", Icons.privacy_tip_outlined,
              currentPage == DrawerSections.privacy_policy ? true : false),
          menuItem(8, "Send feedback", Icons.feedback_outlined,
              currentPage == DrawerSections.send_feedback ? true : false),
        ],
      ),
    );
  }

  Widget menuItem(int id,String title, IconData icon,bool selection) {
    return Material(
      color: selection? Colors.grey.shade300: Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = DrawerSections.dashboard;
            } else if (id == 2) {
              currentPage = DrawerSections.contacts;
            } else if (id == 3) {
              currentPage = DrawerSections.events;
            } else if (id == 4) {
              currentPage = DrawerSections.notes;
            } else if (id == 5) {
              currentPage = DrawerSections.settings;
            } else if (id == 6) {
              currentPage = DrawerSections.notifications;
            } else if (id == 7) {
              currentPage = DrawerSections.privacy_policy;
            } else if (id == 8) {
              currentPage = DrawerSections.send_feedback;
            }
          });
        },
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children:  [
              Expanded(
                  child: Icon(
                    icon,
                    size: 20,
                    color: Colors.black,
                  )),
              Expanded(
                  flex: 3,
                  child: Text(
                    title,
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
enum DrawerSections {
  dashboard,
  contacts,
  events,
  notes,
  settings,
  notifications,
  privacy_policy,
  send_feedback,
}

