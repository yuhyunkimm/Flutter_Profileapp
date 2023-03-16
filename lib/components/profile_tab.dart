import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ProfileTab extends StatefulWidget {
  @override
  _ProfileTabState createState() => _ProfileTabState();
}

// SingleTickerProviderStateMixin 이것은 _tabController에 접근을 할 수없어서 전역으로 빼줘야한다
// initState로  만들고 TabController? _tabController; 만들기
class _ProfileTabState extends State<ProfileTab>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    // 재정의
    super.initState();
    // 변수 length를 넣어야 한다 vsync 이것을 사용 할려면 Mixin으로 만들어 줘야한다
    _tabController = new TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildTabBar(),
        Expanded(child: _buildTabBarView()),
      ],
    );
  }

// TabBar 와 TabBarView는 한쌍으로 사용하자
  Widget _buildTabBar() {
    return TabBar(
      controller: _tabController,
      tabs: [
        Tab(icon: Icon(Icons.directions_car)),
        Tab(icon: Icon(Icons.directions_transit)),
      ],
    );
  }

  Widget _buildTabBarView() {
    return TabBarView(
      // 어디까지 내려갈지 몰라서 height를 해줘야한다(Expanded)
      controller: _tabController,
      children: [
        GridView.builder(
          // GridView.builder 추천
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            // 고정
            crossAxisSpacing: 10, // 방향의 여백을 주는것
            crossAxisCount: 3, // 수평의 갯수
            mainAxisSpacing: 10, // 방향의 여백을 주는것
          ),
          itemCount: 42, // 게시물 갯수
          itemBuilder: (context, index) {
            return Image.network(
                // 사진첩(viewholder)
                // 사진을 다운 받을 때 15개 정도 받아줘서(new) 재활용을 해준다
                // 밑으로 내려갈지 몰라서 단점은 사라진다(cashing이되지않는다)
                // 사진 내용만 바꿔치기 한다 -> 메모리 관리가 효과적이다
                // 재활용 = recycleview

                "https://picsum.photos/id/${index + 1}/200/200");
            // itemCount가 index에 들어온다
          },
        ),
        Container(color: Colors.blue),
      ],
    );
  }
}
