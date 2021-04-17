import 'package:flutter/material.dart';
import 'package:sahiplen/core/base/view/base_view.dart';
import 'package:sahiplen/core/components/button/special_button.dart';
import 'package:sahiplen/core/components/widgets/loading/page_loading_widget.dart';
import 'package:sahiplen/core/extensions/app_extensions.dart';

import 'location_selector_view_page.dart';

class LocationSelectorPage extends StatelessWidget {
  final Function(String)? onCallBack;

  LocationSelectorPage(this.onCallBack);
  @override
  Widget build(BuildContext context) {
    return BaseView<LocationSelectorViewModel>(
        viewModel: LocationSelectorViewModel(onCallBack),
        onModelReady: (model) {
          model.setContext(context);
          model.init();
        },
        onPageBuilder: (BuildContext context, LocationSelectorViewModel viewModel) {
          if (viewModel.pageState == 0) {
            return generalView(context, viewModel);
          } else if (viewModel.pageState == 1) {
            return chooseCity(context, viewModel);
          } else if (viewModel.pageState == 2) {
            return chooseDistrict(context, viewModel);
          } else if (viewModel.pageState == 3) {
            return chooseQuarter(context, viewModel);
          } else {
            return Container();
          }
        });
  }

  Scaffold generalView(BuildContext context, LocationSelectorViewModel viewModel) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Neredesiniz?',
          style: context.textTheme.headline6!.copyWith(color: context.theme.primaryColor),
        ),
        centerTitle: true,
        backgroundColor: context.theme.backgroundColor,
        elevation: 0,
      ),
      body: viewModel.isLoadingInitialize!
          ? Center(child: PageLoadingWidget())
          : Column(
              children: [
                _SelectorElement(
                  name: viewModel.cityName ?? 'Şehir Seçin',
                  isSelected: viewModel.cityName != null,
                  onTap: () => viewModel.pageStateUpdate(1),
                ),
                _SelectorElement(
                  name: viewModel.districtName ?? 'İlçe Seçin',
                  isSelected: viewModel.districtName != null,
                  onTap: () => viewModel.getDistinctUpdate(),
                ),
                _SelectorElement(
                  name: viewModel.quarterName ?? 'Mahalle Seçin',
                  isSelected: viewModel.quarterName != null,
                  onTap: () => viewModel.getQuarterUpdate(),
                ),
                Padding(
                  padding: context.paddingLow,
                  child: SpecialButton(
                    isLoading: viewModel.isLoadingLocation,
                    text: 'Devam',
                    onPressed: () => viewModel.buttonOnPressed,
                  ),
                )
              ],
            ),
    );
  }

  WillPopScope chooseCity(BuildContext context, LocationSelectorViewModel viewModel) {
    return WillPopScope(
      onWillPop: () async => viewModel.onWillPop(),
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton(
            onPressed: () => viewModel.backButtonOnPressed(),
          ),
          title: Text(
            'Hangi Şehirdesiniz?',
            style: context.textTheme.headline6!.copyWith(color: context.theme.primaryColor),
          ),
          centerTitle: true,
          backgroundColor: context.theme.backgroundColor,
          elevation: 0,
        ),
        body: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: viewModel.cityList.length,
          itemBuilder: (context, index) {
            return Container(
              color: index % 2 == 0 ? Colors.white10 : Colors.white,
              child: _SmallListElement(
                name: viewModel.cityList[index],
                onTap: () => viewModel.citySelectOnTap(index),
              ),
            );
          },
        ),
      ),
    );
  }

  WillPopScope chooseDistrict(BuildContext context, LocationSelectorViewModel viewModel) {
    return WillPopScope(
      onWillPop: () async => viewModel.onWillPop(),
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton(
            onPressed: () => viewModel.backButtonOnPressed(),
          ),
          title: Text(
            'Hangi İlçedesin?',
            style: context.textTheme.headline6!.copyWith(color: context.theme.primaryColor),
          ),
          centerTitle: true,
          backgroundColor: context.theme.backgroundColor,
          elevation: 0,
        ),
        body: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: viewModel.districtList.length,
          itemBuilder: (context, index) {
            return Container(
              color: index % 2 == 0 ? Colors.white10 : Colors.white,
              child: _SmallListElement(name: viewModel.districtList[index], onTap: () => viewModel.districtSelectOnTap(index)),
            );
          },
        ),
      ),
    );
  }

  WillPopScope chooseQuarter(BuildContext context, LocationSelectorViewModel viewModel) {
    return WillPopScope(
      onWillPop: () async => viewModel.onWillPop(),
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton(
            onPressed: () => viewModel.backButtonOnPressed(),
          ),
          title: Text(
            'Hangi Mahalledesin?',
            style: context.textTheme.headline6!.copyWith(color: context.theme.primaryColor),
          ),
          centerTitle: true,
          backgroundColor: context.theme.backgroundColor,
          elevation: 0,
        ),
        body: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: viewModel.quarterList.length,
          itemBuilder: (context, index) {
            return Container(
              color: index % 2 == 0 ? Colors.white10 : Colors.white,
              child: _SmallListElement(name: viewModel.quarterList[index], onTap: () => viewModel.quarterSelectOnTap(index)),
            );
          },
        ),
      ),
    );
  }
}

class _SelectorElement extends StatelessWidget {
  final String name;
  final Function() onTap;
  final bool? isSelected;

  const _SelectorElement({Key? key, required this.name, required this.onTap, this.isSelected}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: context.paddingMediumVertical,
        child: Row(
          children: [
            SizedBox(width: context.width * 0.05),
            Container(
              width: context.width * 0.8,
              child: Text(
                name,
                style: context.textTheme.bodyText1!.copyWith(color: isSelected == true ? context.theme.primaryColor : Colors.grey),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
            Container(
              width: context.width * 0.15,
              child: Icon(Icons.arrow_forward_ios_rounded),
            ),
          ],
        ),
      ),
    );
  }
}

class _SmallListElement extends StatelessWidget {
  final String name;
  final Function() onTap;

  const _SmallListElement({Key? key, required this.name, required this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: context.paddingMedium,
        child: Text(
          name,
          style: context.textTheme.bodyText1!.copyWith(color: Colors.grey),
        ),
      ),
    );
  }
}
