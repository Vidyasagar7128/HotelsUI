import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 1, length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Vx.purple500,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: VStack([
            VxBox().size(20, 2).white.make(),
            5.heightBox,
            VxBox().size(27, 2).white.make(),
            5.heightBox,
            VxBox().size(16, 2).white.make(),
            5.heightBox,
          ]).pOnly(left: 16, top: 16),
        ),
        body: Container(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    color: Vx.purple500,
                    elevation: 10,
                    child: Container(
                      height: 100,
                      width: 100,
                    ),
                  )
                ],
              ),
              SizedBox(height: 25.0),
              'hi, '
                  .richText
                  .withTextSpanChildren(['Sonu'.textSpan.white.bold.make()])
                  .white
                  .xl2
                  .make(),
              SizedBox(height: 20.0),
              VxTextField(
                borderRadius: 50,
                prefixIcon: Icon(Icons.search),
                contentPaddingTop: 13,
                contentPaddingLeft: 20,
                borderType: VxTextFieldBorderType.none,
                hint: 'Search',
                fillColor: Vx.gray300.withOpacity(0.4),
              )
                  .p16()
                  .customTheme(
                    themeData: ThemeData(brightness: Brightness.dark),
                  )
                  .cornerRadius(15),
              SizedBox(height: 25.0),
              ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15.0),
                          topRight: Radius.circular(15.0)),
                      child: VxBox(
                          child: VStack([
                        TabBar(
                          controller: _tabController,
                          tabs: [
                            Icon(Icons.home_rounded, color: Colors.purple),
                            Icon(Icons.local_fire_department_rounded,
                                color: Colors.purple),
                            Icon(Icons.trending_up_rounded,
                                color: Colors.purple),
                            Icon(Icons.location_city_outlined,
                                color: Colors.purple),
                          ],
                          indicatorSize: TabBarIndicatorSize.label,
                          unselectedLabelColor: Vx.gray300,
                          labelPadding: Vx.m16,
                        ),
                        TabBarView(
                          controller: _tabController,
                          children: ['1', '2', '3', '4']
                              .map(
                                (e) => Column(
                                  children: [
                                    'Discover Places in India'
                                        .text
                                        .xl2
                                        .make()
                                        .p12(),
                                    HStack(
                                      [
                                        Image.asset(
                                            'assets/images/desktop.jpg'),
                                        .20.widthBox.p2(),
                                        VStack(
                                          [
                                            'Narendra Modi'
                                                .text
                                                .xl
                                                .purple500
                                                .make(),
                                            .5.heightBox,
                                            'From Udgir'
                                                .text
                                                .xl
                                                .purple500
                                                .make()
                                                .shimmer(),
                                            .7.heightBox,
                                            [
                                              VxRating(
                                                  onRatingUpdate: (value) {}),
                                              5.widthBox,
                                            ].row()
                                          ],
                                        ).p12()
                                      ],
                                      crossAlignment: CrossAxisAlignment.start,
                                    )
                                        //.p12()
                                        .cornerRadius(10)
                                        .backgroundColor(Vx.gray300)
                                        .wh(context.percentWidth * 100, 100)
                                        .cornerRadius(10),
                                  ],
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                ).p16(),
                              )
                              .toList(),
                        ).expand()
                      ])).white.make().wh(
                          context.percentWidth *
                              MediaQuery.of(context).size.width,
                          100))
                  .expand()
            ],
          ),
        ));
  }
}
