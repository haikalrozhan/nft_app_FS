// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:nft_app/models/profile.dart';
import 'package:nft_app/screens/profile/widgets/custom_grid.dart';
import 'package:nft_app/screens/profile/widgets/person_info.dart';
import 'package:nft_app/screens/profile/widgets/tab_silver_delegate.dart';

class ProfilePage extends StatelessWidget {
  final profile = Profile.generateProfile();
  ProfilePage ({Key? key}) : super(key:key);
  final tabs = ['Creations', 'Collections'];

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled){
            return <Widget>[
              SliverToBoxAdapter(
                child: PersonInfo(profile: profile,)),
              SliverPersistentHeader(delegate: TabSliverDelegate(
                TabBar(
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey[400],
                  indicatorColor: Colors.black,
                  tabs: tabs.map((e) => Tab(
                    child: Text(e,
                    style: const TextStyle(fontSize: 18, ),
                    ), 
                  )).toList(),
                )
                ),
                pinned: true,
                )
              
            ]; 
          },
          body: TabBarView(
            children: [
              CustomGrid('creation', profile.creations!),
              CustomGrid('collections', profile.collections!),
            ],
          ),
        ),
      )
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: _buildIcon(Icons.arrow_back_ios_outlined),
      actions: [
        _buildIcon(Icons.more_vert_outlined),
      ],

    );
  }

  IconButton _buildIcon(IconData icon) {
    return IconButton(
      splashRadius: 25,
      onPressed: (){}, icon: Icon(
        icon,
        color: Colors.black,
      ),
      );
  }
}