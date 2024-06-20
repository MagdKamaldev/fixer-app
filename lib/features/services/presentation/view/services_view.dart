import 'package:fixer/core/constants/constants.dart';
import 'package:fixer/core/service_locator/service_locator.dart';
import 'package:fixer/core/themes/text_styles.dart';
import 'package:fixer/features/requests/manager/request%20cubit/request_cubit.dart';
import 'package:fixer/features/services/data/reepos/services_repo_impl.dart';
import 'package:fixer/features/services/manager/cubit/services_cubit.dart';
import 'package:fixer/features/services/presentation/view/widgets/services_body.dart';
import 'package:fixer/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';

class ServicesView extends StatefulWidget {
  final int id;
  final String category;
  const ServicesView({
    super.key,
    required this.id,
    required this.category,
  });

  @override
  State<ServicesView> createState() => _ServicesViewState();
}

class _ServicesViewState extends State<ServicesView> {
  LocationData? _currentLocation;

  Future<void> _getCurrentLocation() async {
    Location location = Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;

    // Check if location service is enabled
    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    // Check if permission is granted
    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    final locationData = await location.getLocation();

    setState(() {
      _currentLocation = locationData;
    });

    getAdministrativeArea(_currentLocation!);

    setState(() {
      orderLocation = orderLocation;
    });

  }

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ServicesCubit(getIt<ServicesRepoImpl>())..getServices(widget.id),
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              locale=="en"?"${widget.category} ${S.of(context).services} ":" ${S.of(context).services} ${widget.category}" ,
              style: TextStyles.subHeadingsBold,
            ),
            centerTitle: true,
            toolbarHeight: 100,
          ),
          body: ServicesBody(
            id: widget.id,
          )),
    );
  }
}
