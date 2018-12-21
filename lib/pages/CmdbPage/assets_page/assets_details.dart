// cmdb资产 -> 资产管理
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../../common/baseStyle.dart';
import '../../../utils/mock.dart';

class CMDBAssetsDetalisPage extends StatefulWidget {
  CMDBAssetsDetalisPage({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _CMDBAssetsDetalisPageState createState() =>
      new _CMDBAssetsDetalisPageState();
}

class _CMDBAssetsDetalisPageState extends State<CMDBAssetsDetalisPage> {
  BuildContext context;
  Map<String, dynamic> assetsDetalisMap;

  @override
  void initState() {
    super.initState();
    assetsDetalisMap = _getAssetsDetalisMap();
  }

  List<Map<String, dynamic>> _getListRow() {
    List<Map<String, dynamic>> list = List.generate(3, (i) {
      Map<String, dynamic> row = new Map();
      row['key'] = '属性${(i + 1).toString()}';
      row['val'] = 'dsaqfa';
      return row;
    });
    return list;
  }

  Map<String, dynamic> _getAssetsDetalisMap() {
    Map<String, dynamic> data = new Map();
    data['universalAttr'] = _getListRow();
    data['specialAttr'] = _getListRow();
    data['assetsAccount'] = _getListRow();
    data['protocolSet'] = _getListRow();
    data['docs'] = _getListRow();
    data['life'] = _getListRow();
    return data;
  }

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return WillPopScope(
      child: Scaffold(
        appBar: _appbar(),
        body: _body(),
      ),
      onWillPop: _goback,
    );
  }

  Widget _appbar() {
    final iconSize = 22.0;
    return AppBar(
      title: Container(
        child: Center(
          child: Text(
            '资产详情',
            style: TextStyle(fontSize: BaseStyle.fontSize[0]),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      leading: Builder(builder: (BuildContext context) {
        return IconButton(
          icon: ImageIcon(
            AssetImage("assets/icons/back.png"),
            size: iconSize,
          ),
          onPressed: _goback,
        );
      }),
      actions: <Widget>[
        Container(
          width: iconSize + 26, // 加26是为了补齐偏差
          height: iconSize + 26, // 加26是为了补齐偏差
        ),
      ],
      centerTitle: false, // 消除 android 与 ios 页面title布局差异
      elevation: 0.0, // 去掉appbar下面的阴影
    );
  }

  Widget _body() {
    List<String> keys = assetsDetalisMap.keys.toList();
    List<Widget> children =
        (assetsDetalisMap == null || assetsDetalisMap.length == 0)
            ? <Widget>[]
            : keys.map((String attr) {
                return _listCard(
                  context,
                  attr,
                  assetsDetalisMap[attr],
                );
              }).toList();
    return ListView(
      padding: EdgeInsets.only(top: 10),
      children: children,
      physics: BouncingScrollPhysics(),
    );
  }

  Widget _listCard(
      BuildContext context, String attr, List<Map<String, dynamic>> list) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        color: Color(0xffffffff),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Text(
                attr,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                'fdsafdsafdsafddsafdsafdsakjfglhdsjkalhjkgldhsaklj',
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void cardOnPress(row) {
    print(row.toString());
  }

  Future<bool> _goback() {
    print('_goback');
    Navigator.of(context).pop();
    return new Future.value(false);
  }
}
